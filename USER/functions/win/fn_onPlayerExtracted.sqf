#include "component.hpp"

assert(hasInterface);

params [
    ["_extractToSide", sideUnknown, [sideUnknown]],
    ["_player", objNull, [objNull]]
];
assert(_player isEqualTo player);

[] call ace_spectator_fnc_setSpectator;
