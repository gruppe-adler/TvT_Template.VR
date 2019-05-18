#include "component.hpp"

params ["_objective","_side"];

private _completedSides = _objective getVariable [QGVAR(objectiveCompletedSides),[]];
_completedSides pushBack _side;
_objective setVariable [QGVAR(objectiveCompletedSides),_completedSides,true];

// lock objective
if ((_objective getVariable [QGVAR(singleUse),false]) || (count _completedSides == 2)) then {
    _objective setVariable [QGVAR(objectiveCompletedFinal),true,true];
};
