#include "component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]],
    ["_points", 0, [0]],
    ["_category","Other", [""]]
];

if (_side isEqualTo sideUnknown) exitWith {
    WARNING("cannot set points to sideUnknown!");
    false
};

_points = _points max 0;

private _sidePoints = [GVAR(points), _side] call CBA_fnc_hashGet;
private _oldSidePointsForCategory = [_sidePoints, _category] call CBA_fnc_hashGet;
[_sidePoints, _category, _points] call CBA_fnc_hashSet;

publicVariable QGVAR(points);
true
