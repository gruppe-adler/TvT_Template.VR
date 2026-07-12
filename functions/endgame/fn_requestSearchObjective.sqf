#include "component.hpp"

params [["_objective",objNull],["_caller",objNull]];

// someone else was faster
if !(isNull (_objective getVariable [QGVAR(searchingPlayer),objNull])) exitWith {};
if ((side _caller) in (_objective getVariable [QGVAR(objectiveCompletedSides),[]])) exitWith {};
if (_objective getVariable [QGVAR(objectiveCompletedFinal),false]) exitWith {};

// if searchtime 0, instantly complete
private _searchTime = _objective getVariable [QGVAR(searchTime),0];
if (_searchTime == 0) exitWith {
    [_objective,side _caller] remoteExec FUNC(onObjectiveComplete);
};

_objective setVariable [QGVAR(searchingPlayer),_caller,true];
_this remoteExec [QFUNC(searchObjective),remoteExecutedOwner,false];
