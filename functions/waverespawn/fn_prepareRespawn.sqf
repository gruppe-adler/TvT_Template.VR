#include "component.hpp"

INFO("Ready to respawn. Preparing...");

//respawn not possible
/*
if (player getVariable ["wr_interrupted", false]) exitWith {
    private _playerSide = [player, true] call BIS_fnc_objectSide; // JIP/init proof alternative to playerSide

    player allowDamage true;
    player setDamage 1;
    setPlayerRespawnTime 99999;
    [player, true] call TFAR_fnc_forceSpectator;

    [[], [west, east, independent, civilian]] call ace_spectator_fnc_updateSides;
    private _side = player getVariable ["FF_originalSide", sideUnknown];
    private _playersOfSide = [];
    { 
        if (_x getVariable ["FF_originalSide", sideUnknown] == _side) then { _playersOfSide pushBackUnique _x; };
    } forEach (playableUnits + switchableUnits);
    [_playersOfSide, []] call ace_spectator_fnc_updateUnits;
    [player,_playerSide,false] remoteExec [QFUNC(addToWaiting),2,false];

    _explanation = parseText format ["<t align='center' size='1.4'>%1</t>", "No respawn available."];
    [_playerSide, _explanation] call FUNC(respawnHint);
    [{hint ""}, [], 3] call CBA_fnc_waitAndExecute;
};
*/

setPlayerRespawnTime 5;
forceRespawn player;