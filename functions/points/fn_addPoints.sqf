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

private _sidePoints = GVAR(points) getOrDefault [_side, createHashMap];
private _oldSidePointsForCategory = _sidePoints getOrDefault [_category, 0];
_sidePoints set [_category, _oldSidePointsForCategory + _points];
GVAR(points) set [_side, _sidePoints]; // returning the default value does *not* imply setting it - so we need to explicitly set this at least once.

publicVariable QGVAR(points);
true
