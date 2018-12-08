#include "component.hpp"

if (!isServer) exitWith {};

params [["_activeSectorID",-1]];

GVAR(roundNumber) = (missionNamespace getVariable [QGVAR(roundNumber),0]) + 1;
publicVariable QGVAR(roundNumber);

[_activeSectorID] call FUNC(setActiveSectors);
[] call FUNC(moveRespawnPositions);


[] spawn {

    // black out
    [0,["","BLACK OUT",1.5,true,true]] remoteExec ["cutText",0,false];
    sleep 2.5;

    // don't respawn players in first round
    // don't clean up before first round
    // don't set time and date before first round
    if (GVAR(roundNumber) > 1) then {
        [] remoteExec [QFUNC(respawnPlayer),0,false];
        [] call FUNC(playzoneCleanup);
        [] call FUNC(setTimeAndDate);

    // move players to respawn position manually in first round
    } else {
        {
            [{
                _respawnMarker = ["respawn_west","respawn_east"] select (side _this == EAST);
                _pos = (getMarkerPos _respawnMarker) findEmptyPosition [0,30,"B_Soldier_F"];
                if (_pos isEqualTo []) then {_pos = getMarkerPos _respawnMarker};
                [_this,_pos,nil,nil,nil,false] remoteExec [QEFUNC(common,teleport),_this,false];
            },_x,random 3] call CBA_fnc_waitAndExecute;
        } forEach playableUnits;
    };

    [] call FUNC(activateFortifications);
    {[_x,GVAR(attackingSide)] call FUNC(spawnSectorVehicles)} forEach GVAR(attackerSectors);
    {[_x,GVAR(defendingSide)] call FUNC(spawnSectorVehicles)} forEach GVAR(activeSectors);

    _roundText = format ["Round %1",GVAR(roundNumber)];
    [_roundText,"You are attacking.","cfg\gametypes\seize_ca"] remoteExec [QFUNC(dynamicText),GVAR(attackingSide),false];
    [_roundText,"You are defending.","cfg\gametypes\defend_ca"] remoteExec [QFUNC(dynamicText),GVAR(defendingSide),false];


    sleep 8;

    // preparation time is handled by mission setup in first round
    if (GVAR(roundNumber) > 1) then {
        [["PREPARATION_TIME", 0] call BIS_fnc_getParamValue,{
            missionNamespace setVariable [QGVAR(roundTimeLeft),GVAR(roundLength),true];
            missionNamespace setVariable [QGVAR(roundInProgress),true,true];
        }] call EFUNC(missionSetup,startPreparationTime);
    } else {
        [{missionNamespace getVariable ["GRAD_MISSIONSTARTED",false]},{
            missionNamespace setVariable [QGVAR(roundTimeLeft),GVAR(roundLength),true];
            missionNamespace setVariable [QGVAR(roundInProgress),true,true];
        },[]] call CBA_fnc_waitUntilAndExecute;
    };

    [0,["","BLACK IN",1.5,true,true]] remoteExec ["cutText",0,false];

    sleep 2;

    [] remoteExec [QEFUNC(common,displayDateAndTime),0,false];
};
