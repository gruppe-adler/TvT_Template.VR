#include "component.hpp"

params ["_side","_phaseID"];

// FOB TASKS ===================================================================
if (_phaseID == 0) exitWith {
    {
        if ((_x getVariable [QGVAR(fobSide),sideUnknown]) == _side) then {
            private _taskID = [_x,_side,"fob"] call FUNC(getTaskID);
            private _taskText = _x getVariable [QGVAR(taskText),""];
            private _taskTitle = _x getVariable [QGVAR(taskTitle),""];
            private _taskPos = getPos _x;

            [_taskID,_side,[_taskText,_taskTitle,"attack"],_taskPos,"CREATED",nil,true] call BIS_fnc_setTask;

            _x setVariable [[QGVAR(taskIDEast),QGVAR(taskIDWest)] select (_side == WEST),_taskID,false];
        };
    } forEach GVAR(fobs);
};

// OBJECTIVES TASKS ============================================================
if (_phaseID == 1) exitWith {
    {
        private _taskID = [_x,_side,"obj"] call FUNC(getTaskID);
        private _taskText = _x getVariable [QGVAR(taskText),""];
        private _taskTitle = _x getVariable [QGVAR(taskTitle),""];
        private _taskPos = getPos (_x getVariable [QGVAR(objectiveTrigger),objNull]);

        // check if task has already been completed by other side (e.g. if this side took too long to complete FOB)
        private _taskState = switch (true) do {
            case (_side in (_x getVariable [QGVAR(objectiveCompletedSides),[]])): {"SUCCEEDED"};
            case (_x getVariable [QGVAR(objectiveCompletedFinal),false]): {"FAILED"};
            case (_x getVariable [QGVAR(objectiveDestroyed),false]): {"FAILED"};
            default {"CREATED"};
        };

        [_taskID,_side,[_taskText,_taskTitle,"default"],_taskPos,_taskState,nil,true] call BIS_fnc_setTask;

        _x setVariable [[QGVAR(taskIDEast),QGVAR(taskIDWest)] select (_side == WEST),_taskID,false];
    } forEach GVAR(objectives);
};
