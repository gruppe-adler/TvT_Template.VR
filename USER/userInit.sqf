#define PREFIX MISSION
#define COMPONENT init
#include "\x\cba\addons\main\script_macros_mission.hpp"
#include "..\functions\script_macros_mission.hpp"


/*  Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

if (isServer) then {
    MISSION_timeout = "timeout" call BIS_fnc_getParamValue;
    publicVariable "MISSION_timeout";
    MISSION_overtime = "overtime" call BIS_fnc_getParamValue;
    publicVariable "MISSION_overtime";
    MISSION_grievance_theft_sheep = ("grievance_theft_sheep" call BIS_fnc_getParamValue) / 1000;
    publicVariable "MISSION_grievance_theft_sheep";
    MISSION_grievance_theft_car = ("grievance_theft_car" call BIS_fnc_getParamValue) / 1000;
    publicVariable "MISSION_grievance_theft_car";
    MISSION_grievance_theft_car_transit = ("grievance_theft_car_transit" call BIS_fnc_getParamValue) / 1000;
    publicVariable "MISSION_grievance_theft_car_transit";
    MISSION_grievance_murder = ("grievance_murder" call BIS_fnc_getParamValue) / 1000;
    publicVariable "MISSION_grievance_murder";

    ["CAManBase", "FiredMan", {
        params ["_unit"];
        _unit setVariable ["grad_replay_track", true];
    }] call CBA_fnc_addClassEventHandler;

    ["grad_waverespawn_waveRespawn", {
        params [
            ["_side", sideUnknown, [sideUnknown]],
            ["_playerCount", 0, [0]]
        ];

        private _carClass = "UK3CB_Factions_Vehicles_Ikarus"; // this one should fit even the largest waves. also with that many players, there can be dedicated logistics teams.
        private _marker ="";
        
        switch (_side) do {
            case west: {
                _marker = "respawn_west";
                if (_playerCount < 5) then {
                    _carClass = "gm_ge_civ_typ1200";
                };
                if (_playerCount < 3) then {
                    _carClass = "gm_ge_bgs_k125";
                };
            };
            case east: {
                _marker = "respawn_east";
                if (_playerCount < 6) then {
                    _carClass = "gm_vehicles_land_wheeled_p601_gc_civ_p601";
                };
                if (_playerCount < 3) then {
                    _carClass = "UK3CB_TKC_B_YAVA";
                };                
            };
            default {
                ERROR_1("unexpected grad_waverespawn_waveRespawn event with side %1", _side);
            };
        };

        private _pos = (getMarkerPos _marker) findEmptyPosition [0, 50, _carClass];
        INFO_3("spawning %1 for %2 %3 players", _carClass, _playerCount, _side);
        createVehicle [_carClass, _pos, [], 0, "NONE"];
    }] call CBA_fnc_addEventHandler;

    ["grad_civs_civKilled",
        {
            params [
                ["_civ", objNull],
                ["_killer", objNull]
            ];
            if (isNull _killer) exitWith {};

            [side _killer, MISSION_grievance_murder] call EFUNC(grievances,addGrievance);
        }
    ] call CBA_fnc_addEventHandler;

    ["grad_civs_vehicleTheft",
        {
            params [
                ["_vehicle", objNull],
                ["_thief", objNull]
            ];

            if (isNull _thief) exitWith {
                INFO("vehicle stolen. nobody knows who it was.");
            };
            INFO_1("vehicle stolen. adding grievance to %1.", side _thief);
            private _owner = leader (_vehicle getVariable ["grad_civs_owner", grpNull]);
            private _grievance = if ((_owner getVariable ["grad_civs_primaryTask", ""]) == "transit") then { MISSION_grievance_theft_car_transit } else { MISSION_grievance_theft_car };
            [side _thief, _grievance] call EFUNC(grievances,addGrievance);
        }
    ] call CBA_fnc_addEventHandler;

    ["mission_animal_theft", {
        params [
            ["_animal", objNull, [objNull]],
            ["_thief", objNull, [objNull]]
        ];
        INFO_1("animal stolen. adding grievance to %1.", side _thief);
        [side _thief, MISSION_grievance_theft_sheep] call EFUNC(grievances,addGrievance);

    }] call CBA_fnc_addEventHandler;

    [EFUNC(grievances,civAttack), 15] call CBA_fnc_addPerFrameHandler;

    [QGVAR(handleIndependentKilled), {
        params ["_victim","_victimSide","_victimIsPlayer","_killer","_killerSide","_killerIsPlayer","_killTime"];
        if (_victimSide != independent) exitWith {};
        if (_killerSide in [west, east]) then {
            independent setFriend [_killerSide, 0];
            [_killerSide] call EFUNC(grievances,armyRetaliation);
            MISSION_timeout = MISSION_timeout + MISSION_overtime;
            publicVariable "MISSION_timeout";
        };
    }] call grad_common_fnc_addUnitKilledEH;

    [EFUNC(win,updateFobSheepCount), 5] call CBA_fnc_addPerFrameHandler;

    {
        [{
            params ["_args"];
            _args params ["_marker", "_side"];
            private _extractables = (vehicles + allUnits) inAreaArray _marker;
            if (_extractables isNotEqualTo []) then {
                [_side, _extractables] call mission_win_fnc_extractPlayers; 
            };
        }, 5, _x] call CBA_fnc_addPerFrameHandler;
    } forEach [
        ["border_north", west],
        ["border_south", east]
    ];

    [] call EFUNC(win,createSideTasks);
    [] call EFUNC(win,planPointNotifications);
};

["grad_animalTransport_common_animal_unloaded", {
    params [
        ["_vehicle", objNull, [objNull]],
        ["_animal", objNull, [objNull]],
        ["_instigator", objNull, [objNull]]
    ];
    // do not check for vehicle side, because empty vehicles will be 'civilian'
    // do not check for empty vehicle, because owner mightve been forced to dismount.
    // instead check for civ owner
    if (isNull (_vehicle getVariable ["grad_civs_owner", grpNull])) exitWith {};
    // in that case - because vehicle mightve been stolen long ago - check if sheep have the "stolen" flag already set
    if (_animal getVariable ["mission_isStolen", false]) exitWith {};
    _animal setVariable ["mission_isStolen", true, true];
    ["mission_animal_theft", [_animal, _instigator]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    // unload from pen
    {
        private _pen = _x;   
        private _loadingPoints = [_pen] call grad_animalTransport_common_fnc_getActionOffsets;

        {        
            [_pen, _y, _x] call grad_animalTransport_common_fnc_addUnloadActionPoint;
            private _post = createSimpleObject ["Land_Wired_Fence_4mD_F",  (_pen modelToWorldWorld _y) vectorAdd [0, 0, -1.2]];
            _post setDir (getDir _pen);
        } forEach _loadingPoints;
    } forEach [pen_blu, pen_opf];


    [QEGVAR(win,player_extracted), EFUNC(win,onPlayerExtracted)] call CBA_fnc_addEventHandler;

    [] call EFUNC(win,createPersonalTasks);
    [] call EFUNC(win,registerNotifications);
    [] call EFUNC(win,showOurPoints);

    [[0, 0, 0], [0, 8000, 0]] call mission_gameAreaBarrier_fnc_addGameAreaBarrierBetweenPoints;
    [[8192, 0, 0], [8192, 8000, 0], "left"] call mission_gameAreaBarrier_fnc_addGameAreaBarrierBetweenPoints;
    
};

ISNILS(MISSION_timeout,3600);
