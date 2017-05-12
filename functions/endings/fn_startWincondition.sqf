#include "component.hpp"

params ["_winCondition"];

private _condition = compile ([_winCondition,"condition","false"] call BIS_fnc_returnConfigEntry);
private _checkInterval = [_x,"checkInterval",1] call BIS_fnc_returnConfigEntry;
private _winName = configName _winCondition;

INFO_1("Initialized wincondition %1.",_winName);

[{
    params ["_args","_handle"];
    _args params ["_condition","_winName"];

    if (call _condition) exitWith {
        [_winName] call grad_endings_fnc_endMissionServer;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
},_checkInterval,[_condition,_winName]] call CBA_fnc_addPerFrameHandler;
