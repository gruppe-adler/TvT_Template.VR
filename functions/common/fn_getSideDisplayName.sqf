#include "component.hpp"

params ["_side"];

private _displayName = switch (_side) do {
    case (WEST): {"BLUFOR"};
    case (EAST): {"OPFOR"};
    case (INDEPENDENT): {"Independent"};
    case (CIVILIAN): {"Civilian"};
    default {"unknown side"};
};

_displayName
