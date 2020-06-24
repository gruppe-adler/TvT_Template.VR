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

    ["grad_civs_civKilled",
        {
            params [
                ["_civ", objNull],
                ["_killer", objNull]
            ];
            if (isNull _killer) exitWith {};

            [side _killer, 0.2] call EFUNC(grievances,addGrievance);
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
            private _grievance = if ((_owner getVariable ["grad_civs_primaryTask", ""]) == "transit") then { 0.025 } else { 0.05 };
            [side _thief, _grievance] call EFUNC(grievances,addGrievance);
        }
    ] call CBA_fnc_addEventHandler;

    ["mission_animal_theft", {
        params [
            ["_animal", objNull, [objNull]],
            ["_thief", objNull, [objNull]]
        ];
        INFO_1("animal stolen. adding grievance to %1.", side _thief);
        [side _thief, 0.0025] call EFUNC(grievances,addGrievance);

    }] call CBA_fnc_addEventHandler;

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
};

["grad_animalTransport_animal_unloaded", {
    params [
        ["_vehicle", objNull, [objNull]],
        ["_animal", objNull, [objNull]],
        ["_instigator", objNull, [objNull]]
    ];
    if ((side _vehicle) isEqualTo (side _instigator)) exitWith {};
        // do not check for vehicle side, because empty vehicles will be 'civilian'
        // do not check for empty vehicle, because owner mightve been forced to dismount.
        // instead check for civ owner close by
    private _owners = units (_vehicle getVariable ["grad_civs_owner", grpNull]);
    if ((_owners findIf { (_x distance _vehicle) < 50 }) == -1) exitWith {}; /*owners are far away, it seems */
    ["mission_animal_theft", [_animal, _instigator]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    // unload from pen
    {
        private _pen = _x;
        {
            private _positionedUnloadAction = [
                QGVAR(unloadAction),
                "remove animals from pen",
                "",
                {
                    params ["_target", "_player", "_params"];
                    INFO_1("yay action params are: %1", _params);
                    [_params#0] call grad_animaltransport_fnc_player_unloadAnimals;
                },
                {true},
                {
                    params ["_target", "_player", "_params"];
                    [_params#0] call grad_animaltransport_fnc_interact_unloadChildren
                },
                [_pen],
                [0, 0, 1.78],
                4
            ] call ace_interact_menu_fnc_createAction;

            [
                _x,
                0,
                [],
                _positionedUnloadAction
            ] call ace_interact_menu_fnc_addActionToObject;
        } forEach (nearestObjects [_x, ["Sign_Arrow_Yellow_F"], 20, true]);
    } forEach [pen_blu, pen_opf];


    [QEGVAR(win,player_extracted), EFUNC(win,onPlayerExtracted)] call CBA_fnc_addEventHandler;
};

ISNILS(MISSION_timeout,3600);
