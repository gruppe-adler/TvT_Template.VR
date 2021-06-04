#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]],
    ["_category", "Other", [""]]
];

(GVAR(points) getOrDefault [_side, createHashMap]) getOrDefault [_category, 0]