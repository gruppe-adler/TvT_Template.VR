#include "component.hpp"

params ["_logic"];

if !(_logic isKindOf "LocationArea_F") exitWith {ERROR_1("%1 is not an area logic.",_logic)};

private _triggers = _logic call bis_fnc_moduleTriggers;
if (count _triggers == 0) exitWith {ERROR_1("%1 does not have a connected trigger.",_logic)};

private _area = _triggers select 0;

if (!hasInterface) exitWith {};

[{missionNamespace getVariable ["GRAD_MISSIONSTARTED",false]}, {
    [_this] call grad_common_fnc_restrictZonePFH;
}, _area] call CBA_fnc_waitUntilAndExecute;
