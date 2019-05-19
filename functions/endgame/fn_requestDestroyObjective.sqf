#include "component.hpp"

params [["_objective",objNull],["_caller",objNull]];

if !((side _caller) in (_objective getVariable [QGVAR(objectiveCompletedSides),[]])) exitWith {ERROR_1("Player %1 side is not in objectiveCompletedSides.",_caller)};
if (_objective getVariable [QGVAR(objectiveDestroyed),false]) exitWith {ERROR_1("Objective %1 is already destroyed.",_objective)};

[_objective] call FUNC(onObjectiveDestroyed);
