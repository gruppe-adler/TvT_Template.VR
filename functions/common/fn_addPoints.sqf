#include "component.hpp"

if (!isServer) exitWith {_this remoteExec ["grad_common_fnc_addPoints",2,false]};

params ["_side","_points",["_reason","Other"]];
private ["_newPoints","_reasons"];

switch (_side) do {
    case (WEST): {
        _newPoints = ((missionNamespace getVariable ["grad_common_points_west",0]) + _points) max 0;
        _reasons = missionNamespace getVariable "grad_common_points_west_reasons";
        if (isNil "_reasons") then {missionNamespace setVariable ["grad_common_points_west_reasons",[]]; _reasons = missionNamespace getVariable "grad_common_points_west_reasons"};
        missionNamespace setVariable ["grad_common_points_west",_newPoints];
    };
    case (EAST): {
        _newPoints = ((missionNamespace getVariable ["grad_common_points_east",0]) + _points) max 0;
        _reasons = missionNamespace getVariable "grad_common_points_east_reasons";
        if (isNil "_reasons") then {missionNamespace setVariable ["grad_common_points_east_reasons",[]]; _reasons = missionNamespace getVariable "grad_common_points_east_reasons"};
        missionNamespace setVariable ["grad_common_points_east",_newPoints];
    };
    case (INDEPENDENT): {
        _newPoints = ((missionNamespace getVariable ["grad_common_points_independent",0]) + _points) max 0;
        _reasons = missionNamespace getVariable "grad_common_points_independent_reasons";
        if (isNil "_reasons") then {missionNamespace setVariable ["grad_common_points_independent_reasons",[]]; _reasons = missionNamespace getVariable "grad_common_points_independent_reasons"};
        missionNamespace setVariable ["grad_common_points_independent",_newPoints];
    };
    case (CIVILIAN): {
        _newPoints = ((missionNamespace getVariable ["grad_common_points_civilian",0]) + _points) max 0;
        _reasons = missionNamespace getVariable "grad_common_points_civilian_reasons";
        if (isNil "_reasons") then {missionNamespace setVariable ["grad_common_points_civilian_reasons",[]]; _reasons = missionNamespace getVariable "grad_common_points_civilian_reasons"};
        missionNamespace setVariable ["grad_common_points_civilian",_newPoints];
    };
    default {
        _newPoints = 0;
    };
};

private _resultID = [_reasons,_reason] call BIS_fnc_findInPairs;
if (_resultID < 0) then {
    _reasons pushBack [_reason,_points]
} else {
    _reasons set [_resultID,[_reason,(((_reasons select _resultID) select 1) + _points) max 0]];
};

_newPoints
