#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull]];

private _triggers = _logic call bis_fnc_moduleTriggers;
private _fortifications = (synchronizedObjects _logic) select {
    !(_x isKindOf "Logic") &&
    !(_x in _triggers)
};

{
    _x setVariable [QGVAR(fortifications),_fortifications];
} forEach _triggers;
