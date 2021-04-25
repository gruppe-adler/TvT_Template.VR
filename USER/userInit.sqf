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

    ISNILS(GVAR(attackingCivs), []);
    [{
        // if (random 1 > 0.2) exitWith {};
        GVAR(attackingCivs) = GVAR(attackingCivs) select { alive _x};
        if (count GVAR(attackingCivs) > 50) exitWith { WARNING("a lot of civs are attacking. not spawning any more.")};
        // attack some FOB
        private _sideToAttack = selectRandom ([east, west] select { civilian getFriend _x < 0.6 });
        if (isNil "_sideToAttack") exitWith {};
        INFO_1("side to attack %1", _sideToAttack);
        private _fob = switch (_sideToAttack) do {
            case (east): { pen_opf };
            case (west): { pen_blu };
            default { objNull };
        };
        private _group = createGroup [civilian, true];
        private _count = round linearConversion [0.6, 0.0, civilian getFriend _sideToAttack, 1, 16, false];
        private _house = [
            allPlayers,
            500,
            1000,
            "house"
        ] call grad_civs_legacy_fnc_findSpawnPosition;
        if (isNull _house) exitWith {INFO("cant find house for attacking civs, sad");};

        for "_i" from 1 to _count do {
            private _unit = _group createUnit ["C_Man_1", getPos _house, [], 0, "NONE"];
            _unit addUniform selectRandom ["UK3CB_ADC_C_U_01", "UK3CB_ADC_C_U_01_B", "UK3CB_ADC_C_U_01_C", "UK3CB_ADC_C_U_01_D", "UK3CB_ADC_C_U_01_E", "UK3CB_ADC_C_U_01_F", "UK3CB_ADC_C_U_01_G", "UK3CB_ADC_C_U_01_H", "UK3CB_ADC_C_U_01_I", "UK3CB_ADC_C_U_01_J", "UK3CB_ADC_C_U_01_K"];
            _unit addHeadgear "UK3CB_TKC_H_Turban_01_1";
            if (random 1 > 0.5) then {
                _unit addWeapon "rhs_weap_m38";
                [_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
                [_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
                [_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
                [_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
                [_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
            } else {
                _unit addWeapon "rhs_weap_makarov_pm";
                [_unit, "rhs_mag_9x18_8_57N181S"] call CBA_fnc_addMagazine;
                [_unit, "rhs_mag_9x18_8_57N181S"] call CBA_fnc_addMagazine;
                [_unit, "rhs_mag_9x18_8_57N181S"] call CBA_fnc_addMagazine;
            };
        };
        GVAR(attackingCivs) = GVAR(attackingCivs) + (units _group);

        private _icon = _group addGroupIcon ["o_inf", [0, 0]];
        //_group setGroupIcon [_icon, "hc_selectedEnemy"];
        _group setGroupIconParams [[0.8, 0, 0.8, 1],"attacking civs", 1, true, true, [0, 0, 0, 1]];

        INFO_3("%1 is at %2 and will attack %3", _group, getPos leader _group, _fob);
        [_group, _fob] call EFUNC(grievances,attackLocation);
    }, 15] call CBA_fnc_addPerFrameHandler;

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

    [] call EFUNC(win,createSideTasks);
    [] call EFUNC(win,planPointNotifications);
};

["grad_animalTransport_animal_unloaded", {
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

    [] call EFUNC(win,createPersonalTasks);
    [] call EFUNC(win,registerNotifications);
};

ISNILS(MISSION_timeout,3600);
