#include "component.hpp"

params ["_trigger"];

private _side = _trigger getVariable [QGVAR(fobSide),sideUnknown];

private _gamephaseVar = [QGVAR(gamePhaseIDEast),QGVAR(gamePhaseIDWest)] select (_side == WEST);
missionNamespace setVariable [_gamephaseVar,1,true];

private _taskID = _trigger getVariable [[QGVAR(taskIDEast),QGVAR(taskIDWest)] select (_side == WEST),""];
if ([_taskID] call BIS_fnc_taskExists) then {
    [_taskID,"SUCCEEDED",true] call BIS_fnc_taskSetState;
};

[_side,1] call FUNC(createTasks);
