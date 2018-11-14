#include "component.hpp"

if (([missionConfigFile >> "missionsettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 0) exitWith {};

wavePlayernamesBlu = [];
wavePlayernamesOpf = [];
wavePlayernamesInd = [];
waitingPlayersBlu = [];
waitingPlayersOpf = [];
waitingPlayersInd = [];
newBluSpawns = [];
newOpfSpawns = [];
newIndSpawns = [];

if (isServer) then {
    [] call grad_waverespawn_fnc_setWaveSize;
    [] call grad_waverespawn_fnc_startWaveLoops;
    addMissionEventHandler ["HandleDisconnect", {
        params [["_unit",objNull],"","",["_name",""]];
        [_name,side _unit] call grad_waverespawn_fnc_removeFromWave;
        [_unit,side _unit,false] call grad_waverespawn_fnc_addToWaiting;
    }];
};

if (hasInterface) then {
    player setVariable ["joinTime", serverTime];
    player setVariable ["wr_respawnCount",0];
    [] call grad_waverespawn_fnc_resetPlayerVars;
};
