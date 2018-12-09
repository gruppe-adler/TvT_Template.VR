#include "component.hpp"

private _activeSectorBeingCaptured = false;

{
    _sideStrengths = _x getVariable QEGVAR(sectors,sideStrengths);
    if (selectMax _sideStrengths > 0) exitWith {
        _activeSectorBeingCaptured = true;
    };
} forEach GVAR(activeSectors);

_activeSectorBeingCaptured
