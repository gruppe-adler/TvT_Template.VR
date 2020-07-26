#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]],
    ["_category", "Other", [""]]
];

[
    [GVAR(points), _side] call CBA_fnc_hashGet,
    _category
] call CBA_fnc_hashGet
