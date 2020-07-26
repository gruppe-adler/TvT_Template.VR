#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]]
];

private _categorizedPoints = [[GVAR(points), _side] call CBA_fnc_hashGet] call CBA_fnc_hashValues;

private _sum = 0;
{ _sum = _sum + _x } forEach _categorizedPoints;

_sum
