#include "component.hpp"

if (([missionConfigFile >> "missionsettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 0) exitWith {};

GVAR(wavePlayersBlu) = [];
GVAR(wavePlayersOpf) = [];
GVAR(wavePlayersInd) = [];
GVAR(wavePlayersCiv) = [];
GVAR(waitingPlayersBlu) = [];
GVAR(waitingPlayersOpf) = [];
GVAR(waitingPlayersInd) = [];
GVAR(waitingPlayersCiv) = [];
GVAR(newBluSpawns) = [];
GVAR(newOpfSpawns) = [];
GVAR(newIndSpawns) = [];
GVAR(newCivSpawns) = [];

if (isServer) then {
    [] call FUNC(setWaveSize);
    [] call FUNC(startWaveLoops);
    addMissionEventHandler ["HandleDisconnect", {
        params [["_unit",objNull]];
        private _unitSide = [_unit, true] call BIS_fnc_objectSide; // JIP/init proof alternative to playerSide

        [_unit, [_unitSide]] call FUNC(removeFromWave);
        [_unit, _unitSide, false] call FUNC(addToWaiting);
    }];
};

if (hasInterface) then {
    player setVariable ["joinTime", serverTime];
    player setVariable ["wr_respawnCount",0];
    [] call FUNC(resetPlayerVars);
};
