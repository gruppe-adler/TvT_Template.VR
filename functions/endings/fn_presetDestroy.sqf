#include "component.hpp"

params ["_winName",["_presetParams",[]]];

_presetParams = _presetParams apply {call compile _x};

[{
    params ["_args","_handle"];
    _args params ["_winName","_presetParams"];

    if ({alive _x} count _presetParams == 0) exitWith {
        [_winName] call grad_endings_fnc_endMissionServer;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
} , 10, [_winName,_presetParams]] call CBA_fnc_addPerFrameHandler;
