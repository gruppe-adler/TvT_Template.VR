#include "component.hpp"

params [
    ["_attacker", grpNull, [grpNull]],
    ["_location", objNull, [objNull, []]]
];

private _position = [0, 0, 0];
if (_location isEqualType []) then {
    _position = _location;
} else {
    _position = getPos _location;
};

private _waypoint = _attacker addWaypoint [_position, 0];
private _speed = if (4 > random 100) then {"NORMAL"} else {"LIMITED"};

_waypoint setWaypointType "SAD";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointFormation "DIAMOND";

_waypoint
