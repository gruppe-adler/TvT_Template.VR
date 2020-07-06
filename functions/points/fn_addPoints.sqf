#include "component.hpp"

if (!isServer) exitWith {_this remoteExec [QFUNC(addPoints),2,false]};

params [
    ["_side", sideUnknown, [sideUnknown]],
    ["_points", 0, [0]],
    ["_category","Other", [""]]
];

if (_side isEqualTo sideUnknown) exitWith {
    WARNING("cannot set points to sideUnknown!");
    false
};

private _sidePoints = [GVAR(points), _side] call CBA_fnc_hashGet;
private _oldSidePointsForCategory = [_sidePoints, _category] call CBA_fnc_hashGet;
[_sidePoints, _category, _oldSidePointsForCategory + _points] call CBA_fnc_hashSet;
[GVAR(points), _side, _sidePoints] call CBA_fnc_hashSet; // returning the default value does *not* imply setting it - so we need to explicitly set this at least once.

publicVariable QGVAR(points);
true
