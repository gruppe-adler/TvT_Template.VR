#include "component.hpp"

params ["_timeOfDeath"];

if (player getVariable "wr_interrupted") exitWith {player setVariable ["wr_waveCountdownDone", true]};
if (player getVariable "wr_isFreeRespawn") exitWith {player setVariable ["wr_waveCountdownDone", true]};

INFO("Player countdown done. Starting wave countdown...");

private _playerSide = [player, true] call BIS_fnc_objectSide; // JIP/init proof alternative to playerSide
[player, _playerSide] remoteExec [QFUNC(addToWave),2,false];

[{
    params ["_args", "_handle"];
    _args params ["_timeOfDeath", "_playerSide"];

    //check interrupt
    if (call (player getVariable "wr_interruptCondition")) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_interrupted", true];
        player setVariable ["wr_waveCountdownDone", true];
        INFO("Respawn interrupted.");
    };

    //check max respawn time
    if ((time - _timeOfDeath) > GVAR(MAXRESPAWNTIME)) then {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_isFreeRespawn", true];
        player setVariable ["wr_waveCountdownDone", true];
        INFO("Max respawn time reached.");
    };

    if (!(call (player getVariable ["wr_waitCondition",{false}])) || player getVariable ["wr_isFreeRespawn", false] || player getVariable ["wr_interrupted", false]) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_waveCountdownDone", true];
    };

    [_playerSide] call FUNC(respawnHint);

}, 1, [_timeOfDeath, _playerSide]] call CBA_fnc_addPerFrameHandler;
