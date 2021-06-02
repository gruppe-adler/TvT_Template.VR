#include "component.hpp"

assert(hasInterface);

params [
    ["_extractToSide", sideUnknown, [sideUnknown]],
    ["_player", objNull, [objNull]]
];

if (_player  isEqualTo player) then {
    [] call ace_spectator_fnc_setSpectator;
} else {
    WARNING_1("player %1 is not local player!",_player);
};
