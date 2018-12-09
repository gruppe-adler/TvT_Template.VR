#include "component.hpp"

["Terminate"] call BIS_fnc_EGSpectator;

// don't start spectator in between rounds, because player will respawn shortly
if (GVAR(roundInProgress)) then {
    ["Initialize", [player, [WEST,EAST,INDEPENDENT], true]] call BIS_fnc_EGSpectator;
};
