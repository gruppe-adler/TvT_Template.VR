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
private _newFriendPoints = 0 max (_friendPoints - _grievancePoints);
civilian setFriend [_side, _newFriendPoints];
if (_friendPoints >= 0.6 && _newFriendPoints < 0.6) then {
    ["mission_news", ["civ_enemy", _side]] call CBA_fnc_globalEvent;
};

// anything bad you're doing makes the army hate you
INFO_1("army will hate %1 now", _side);
if (independent getFriend _side != 0) then {
    // TODO show hint to all players
    independent setFriend [_side, 0];
    ["mission_news", ["army_enemy", _side]] call CBA_fnc_globalEvent;
};
