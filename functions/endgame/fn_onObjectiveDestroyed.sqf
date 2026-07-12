#include "component.hpp"

params ["_objective"];

_objective setVariable [QGVAR(objectiveDestroyed),true,true];

{
    // if other side has not completed objective >> fail their task
    if !(_x in (_objective getVariable [QGVAR(objectiveCompletedSides),[]])) then {
        private _taskID = [_objective,_x,"obj"] call FUNC(getTaskID);
        if ([_taskID] call BIS_fnc_taskExists) then {
            [_taskID,"FAILED",true] call BIS_fnc_taskSetState;
        };
    };
} forEach [WEST,EAST];
