#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]]
];

ISNILS(GVAR(retaliatedFlag), [ARR_2([],false)] call CBA_fnc_hashCreate);
[GVAR(retaliatedFlag), _side] call CBA_fnc_hashGet;
