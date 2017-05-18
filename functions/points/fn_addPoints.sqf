#include "component.hpp"

if (!isServer) exitWith {_this remoteExec ["grad_points_fnc_addPoints",2,false]};

params ["_side","_points",["_category","Other"]];
private ["_newPoints","_categories"];

switch (_side) do {
    case (WEST): {
        _newPoints = (missionNamespace getVariable ["grad_common_points_west",0]) + _points;
        _categories = missionNamespace getVariable "grad_common_points_west_categories";
        if (isNil "_categories") then {missionNamespace setVariable ["grad_common_points_west_categories",[]]; _categories = missionNamespace getVariable "grad_common_points_west_categories"};
        missionNamespace setVariable ["grad_common_points_west",_newPoints];
    };
    case (EAST): {
        _newPoints = (missionNamespace getVariable ["grad_common_points_east",0]) + _points;
        _categories = missionNamespace getVariable "grad_common_points_east_categories";
        if (isNil "_categories") then {missionNamespace setVariable ["grad_common_points_east_categories",[]]; _categories = missionNamespace getVariable "grad_common_points_east_categories"};
        missionNamespace setVariable ["grad_common_points_east",_newPoints];
    };
    case (INDEPENDENT): {
        _newPoints = (missionNamespace getVariable ["grad_common_points_independent",0]) + _points;
        _categories = missionNamespace getVariable "grad_common_points_independent_categories";
        if (isNil "_categories") then {missionNamespace setVariable ["grad_common_points_independent_categories",[]]; _categories = missionNamespace getVariable "grad_common_points_independent_categories"};
        missionNamespace setVariable ["grad_common_points_independent",_newPoints];
    };
    case (CIVILIAN): {
        _newPoints = (missionNamespace getVariable ["grad_common_points_civilian",0]) + _points;
        _categories = missionNamespace getVariable "grad_common_points_civilian_categories";
        if (isNil "_categories") then {missionNamespace setVariable ["grad_common_points_civilian_categories",[]]; _categories = missionNamespace getVariable "grad_common_points_civilian_categories"};
        missionNamespace setVariable ["grad_common_points_civilian",_newPoints];
    };
    default {
        _newPoints = 0;
    };
};

private _resultID = [_categories,_category] call BIS_fnc_findInPairs;
if (_resultID < 0) then {
    if (_points != 0) then {
        _categories pushBack [_category,_points]
    };
} else {
    _categoryPoints = ((_categories select _resultID) select 1) + _points;
    if (_categoryPoints != 0) then {
        _categories set [_resultID,[_category,((_categories select _resultID) select 1) + _points]];
    } else {
        _categories deleteAt _resultID;
    };
};

_newPoints
