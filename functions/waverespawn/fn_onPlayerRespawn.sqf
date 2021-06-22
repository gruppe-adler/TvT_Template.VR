#include "component.hpp"

params ["",["_oldUnit",objNull]];

private _playerSide = [player, true] call BIS_fnc_objectSide; // JIP/init proof alternative to playerSide
[_oldUnit,_playerSide] remoteExec [QFUNC(removeFromWave),2,false];
[_oldUnit,_playerSide,false] remoteExec [QFUNC(addToWaiting),2,false];

setPlayerRespawnTime 99999;

hint "";

[] call FUNC(resetPlayerVars);

// prevent all players respawning at west if fake sides are used
private _respawnMarker = "respawn_west";
switch (_playerSide) do { 
    case west : { _respawnMarker = "respawn_west"; }; 
    case east : { _respawnMarker = "respawn_east"; };
    case independent : { _respawnMarker = "respawn_independent"; };
    default { diag_log ("onPlayerRespawn: no playerside matching!" + str _playerSide); }; 
};

private _pos = (getMarkerPos _respawnMarker) findEmptyPosition [0,30,"B_Soldier_F"];
if (_pos isEqualTo []) then {_pos = getMarkerPos _respawnMarker};
[player,_pos] call EFUNC(common,teleport);

diag_log format ["onPlayerRespawn: teleporting to %1 as playerSide is %2", _respawnMarker, _playerSide];