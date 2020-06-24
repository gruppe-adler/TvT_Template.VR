#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]],
    ["_grievancePoints", 0.0, [0]]
];

assert(isServer);

if !(_side in [west, east]) exitWith {
    INFO_1("unexpected griefing side %1", _side);
};

private _friendPoints = civilian getFriend _side;
civilian setFriend [_side, 0 max (_friendPoints - _grievancePoints)];

// anything bad you're doing makes the army hate you
INFO_1("army will hate %1 now", _side);
if (independent getFriend _side != 0) then {
    // TODO show hint to all players
    independent setFriend [_side, 0];
};
