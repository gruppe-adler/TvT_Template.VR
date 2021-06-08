#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]]
];

private _pairs = [];
{
    _pairs pushBack [_x, _y];
} forEach (GVAR(points) getOrDefault [_side, createHashMap]);

_pairs
