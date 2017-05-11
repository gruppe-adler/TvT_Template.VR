#include "component.hpp"

if (([missionConfigFile >> "missionsettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 0) exitWith {};

deadPlayersBlu = [];
deadPlayersOpf = [];
deadPlayersInd = [];
newBluSpawns = [];
newOpfSpawns = [];
newIndSpawns = [];

if (isServer) then {
    [] call grad_waverespawn_fnc_setWaveSize;
    [] call grad_waverespawn_fnc_startWaveLoops;
    addMissionEventHandler ["HandleDisconnect", {[_this select 0,side (_this select 0)] call grad_waverespawn_fnc_removeFromWave}];
};

if (hasInterface) then {
    player setVariable ["joinTime", serverTime];
    player setVariable ["wr_respawnCount",0];
    [] call grad_waverespawn_fnc_resetPlayerVars;
};
