#include "component.hpp"

params ["_side"];

private _reasons = switch (_side) do {
    case (WEST): {
        missionNamespace getVariable ["grad_common_points_west_reasons",[]];
    };
    case (EAST): {
        missionNamespace getVariable ["grad_common_points_east_reasons",[]];
    };
    case (INDEPENDENT): {
        missionNamespace getVariable ["grad_common_points_independent_reasons",[]];
    };
    case (CIVILIAN): {
        missionNamespace getVariable ["grad_common_points_civilian_reasons",[]];
    };
    default {
        []
    };
};

_reasons
