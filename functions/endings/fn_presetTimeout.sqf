#include "component.hpp"

params ["_winName","_presetParams"];
_presetParams params ["_time",["_condition","true"]];

_condition = compile _condition;

[{
    params ["_winName","_condition"];
    [_condition, {[_this] call grad_endings_fnc_endMissionServer}, _winName] call CBA_fnc_waitUntilAndExecute;
}, [_winName,_condition], _time] call CBA_fnc_waitAndExecute;
