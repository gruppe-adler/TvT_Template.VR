#include "component.hpp"

private _winConditions = "true" configClasses (missionConfigFile >> "CfgWinConditions");

{
    _condition = compile ([_x,"condition","false"] call BIS_fnc_returnConfigEntry);
    _winners = [_x,"winners",[]] call BIS_fnc_returnConfigEntry;
    _winName = configName _x;
    _checkInterval = [_x,"checkInterval",1] call BIS_fnc_returnConfigEntry;

    INFO_1("Initialized wincondition %1.",_winName);

    [{
        params ["_args","_handle"];
        _args params ["_condition","_winName"];

        if (call _condition) exitWith {
            [_winName] call grad_endings_fnc_endMissionServer;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
    },_checkInterval,[_condition,_winName]] call CBA_fnc_addPerFrameHandler;
    false
} count _winConditions;
