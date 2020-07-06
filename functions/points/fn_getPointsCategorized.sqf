#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]]
];

private _pairs = [];
[
    [GVAR(points), _side] call CBA_fnc_hashGet,
    { _pairs pushBack [_key, _value] }
] call CBA_fnc_hashEachPair;

_pairs
