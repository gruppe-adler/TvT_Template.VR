#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull]];

{
    _x setVariable [QGVAR(respawnPosition),getPos _logic,true];
} forEach (_logic call bis_fnc_moduleTriggers);
