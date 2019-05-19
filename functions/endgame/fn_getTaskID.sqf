#include "component.hpp"

params ["_objective","_side","_type"];

// wiki says to keep task IDs short
private _taskID = format ["tsk_%1_%2_%3",_side,_type,_objective getVariable [QGVAR(objectiveID),-1]];

_taskID
