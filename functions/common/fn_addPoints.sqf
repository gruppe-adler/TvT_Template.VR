#include "component.hpp"

params ["_side","_points"];
private ["_newPoints"];

switch (_side) do {
    case (WEST): {
        _newPoints = ((missionNamespace getVariable ["grad_common_points_west",0]) + _points) max 0;
        missionNamespace setVariable ["grad_common_points_west",_newPoints];
    };
    case (EAST): {
        _newPoints = ((missionNamespace getVariable ["grad_common_points_east",0]) + _points) max 0;
        missionNamespace setVariable ["grad_common_points_east",_newPoints];
    };
    case (INDEPENDENT): {
        _newPoints = ((missionNamespace getVariable ["grad_common_points_independent",0]) + _points) max 0;
        missionNamespace setVariable ["grad_common_points_independent",_newPoints];
    };
    case (CIVILIAN): {
        _newPoints = ((missionNamespace getVariable ["grad_common_points_civilian",0]) + _points) max 0;
        missionNamespace setVariable ["grad_common_points_civilian",_newPoints];
    };
    default {
        _newPoints = 0;
    };
};

_newPoints
