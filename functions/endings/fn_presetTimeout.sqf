#include "component.hpp"

params ["_winName","_presetParams"];
_presetParams params ["_time",["_condition","true"]];

_condition = compile _condition;

[{
    params ["_winName","_condition"];
    [_condition, {[_this] call grad_endings_fnc_endMissionServer}, _winName] call CBA_fnc_waitUntilAndExecute;
}, [_winName,_condition], _time] call CBA_fnc_waitAndExecute;

if (_time > 600) then {
    [{
        ["grad_notification1",["TIME","There are 10min left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];
    },[],_time - 600] call CBA_fnc_waitAndExecute;
};
