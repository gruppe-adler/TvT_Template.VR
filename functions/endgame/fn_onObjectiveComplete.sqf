#include "component.hpp"

params ["_objective","_side"];

private _completedSides = _objective getVariable [QGVAR(objectiveCompletedSides),[]];
_completedSides pushBack _side;

_objective setVariable [QGVAR(objectiveCompletedSides),_completedSides,true];
_objective setVariable [QGVAR(searchingPlayer),objNull,true];

// complete task
[[_objective,_side,"obj"] call FUNC(getTaskID),"SUCCEEDED",true] call BIS_fnc_taskSetState;

private _otherSide = [WEST,EAST] select (_side == WEST);

// start phase 3 if threshold is met
private _completedObjectivesAmount = {_side in (_x getVariable [QGVAR(objectiveCompletedSides),[]])} count GVAR(objectives);
if (_completedObjectivesAmount >= GVAR(phase3Threshold)) exitWith {
    [_side] call FUNC(startPhase3);
};

// lock objective
if ((_objective getVariable [QGVAR(singleUse),false]) || (count _completedSides == 2)) then {
    _objective setVariable [QGVAR(objectiveCompletedFinal),true,true];

    if !(_otherSide in _completedSides) then {
        // check if task exists for other side in case they are still on their FOB task
        private _taskID = [_objective,_otherSide,"obj"] call FUNC(getTaskID);
        if ([_taskID] call BIS_fnc_taskExists) then {
            [_taskID,"FAILED",true] call BIS_fnc_taskSetState;
        };
    };
};
