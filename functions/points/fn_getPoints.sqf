#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]]
];

private _categorizedPoints = [
    GVAR(points) getOrDefault [_side, createHashMap]
] call CBA_fnc_hashValues;

private _sum = 0;
{ _sum = _sum + _y } forEach _categorizedPoints;

_sum
