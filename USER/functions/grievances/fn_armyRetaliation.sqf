#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]]
];

ISNILS(GVAR(retaliatedFlag), [ARR_2([],false)] call CBA_fnc_hashCreate);
if ([GVAR(retaliatedFlag), _side] call CBA_fnc_hashGet) exitWith {
    INFO_1("aborting: retaliation on %1 has already been called", _side)
};
[GVAR(retaliatedFlag), _side, true] call CBA_fnc_hashSet;

private _attackPos = switch (_side) do {
    case (east): { fob_opf };
    case (west): { fob_blu };
    default { ERROR_1("retaliation called for %1, this should not happen", _side); };
};

// NOTE: retaliating army units are being controlled via script in waypoints -> mission.sqm

// inform players
["mission_news", ["army_retaliation", _side]] call CBA_fnc_globalEvent;
