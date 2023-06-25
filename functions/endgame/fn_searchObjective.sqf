#include "component.hpp"

params ["_objective","_caller"];

private _searchTime = _objective getVariable [QGVAR(searchTime),10];

private _fnc_onSuccess = {
    params ["_args"];
    _args params ["_objective","_caller"];
    [_objective,side _caller] remoteExec [QFUNC(onObjectiveComplete),2,false];
};

private _fnc_onFailure = {
    params ["_args"];
    _args params ["_objective","_caller"];
    [_objective,_caller] remoteExec [QFUNC(requestCancelSearchObjective),2,false];
};

["Searching...",_searchTime,{alive ACE_player && {!(ACE_player getVariable ["ACE_isUnconscious",false])}},_fnc_onSuccess,_fnc_onFailure,_this] call CBA_fnc_progressBar;
