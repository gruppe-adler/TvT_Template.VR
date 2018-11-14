#include "component.hpp"

params ["",["_oldUnit",objNull]];

[profileName,playerSide] remoteExec ["grad_waverespawn_fnc_removeFromWave",2,false];
[_oldUnit,playerSide,false] remoteExec ["grad_waverespawn_fnc_addToWaiting",2,false];

setPlayerRespawnTime 99999;

hint "";

[] call grad_waverespawn_fnc_resetPlayerVars;
