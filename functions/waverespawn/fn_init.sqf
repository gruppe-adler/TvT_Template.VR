#include "component.hpp"

if (([missionConfigFile >> "missionsettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 0) exitWith {};

GVAR(wavePlayersBlu) = [];
GVAR(wavePlayersOpf) = [];
GVAR(wavePlayersInd) = [];
GVAR(waitingPlayersBlu) = [];
GVAR(waitingPlayersOpf) = [];
GVAR(waitingPlayersInd) = [];
GVAR(newBluSpawns) = [];
GVAR(newOpfSpawns) = [];
GVAR(newIndSpawns) = [];

if (isServer) then {
    [] call FUNC(setWaveSize);
    [] call FUNC(startWaveLoops);
    addMissionEventHandler ["HandleDisconnect", {
        params [["_unit",objNull]];
        [_unit,side _unit] call FUNC(removeFromWave);
        [_unit,side _unit,false] call FUNC(addToWaiting);
    }];
};

if (hasInterface) then {
    player setVariable ["joinTime", serverTime];
    player setVariable ["wr_respawnCount",0];
    [] call FUNC(resetPlayerVars);
};
