#include "component.hpp"

params ["",["_oldUnit",objNull]];

[_oldUnit,playerSide] remoteExec [QFUNC(removeFromWave),2,false];
[_oldUnit,playerSide,false] remoteExec [QFUNC(addToWaiting),2,false];

setPlayerRespawnTime 99999;

hint "";

[] call FUNC(resetPlayerVars);
