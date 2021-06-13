#include "component.hpp"

assert(hasInterface);

params [
    ["_extractToSide", sideUnknown, [sideUnknown]],
    ["_player", objNull, [objNull]]
];

if (_player isEqualTo player) then {
    [] call ace_spectator_fnc_setSpectator;
    ["stayAlive", "SUCCEEDED", false] call BIS_fnc_taskSetState;
} else {
    if (isPlayer _player) then {
        WARNING_1("player %1 is not local player!",_player);
    } else {
        WARNING_1("deleting player %1 which is not a player at all.", _player);
        deleteVehicle _player; 
    };
    
};
