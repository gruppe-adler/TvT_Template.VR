/* sets respawn interrupted, if remaining players are not enough for a full wave
*/

#include "component.hpp"

params ["_side",["_iteration",0]];

private _waitingPlayersArray = switch (_side) do {
    case (WEST): {waitingPlayersBlu};
    case (EAST): {waitingPlayersOpf};
    case (INDEPENDENT): {waitingPlayersInd};
    default {[]};
};


// exit here if it's the second iteration (so players have either been dead or unconscious for 10s)
if (_iteration == 2) exitWith {
    {
        _x setVariable ["wr_interrupted",true,true];
    } forEach _waitingPlayersArray;
};


private _waveSize = switch (_side) do {
    case (WEST): {BLUFORWAVESIZE};
    case (EAST): {OPFORWAVESIZE};
    case (INDEPENDENT): {INDEPWAVESIZE};
    default {-1};
};
if (_waveSize < 0) exitWith {};


if ((({side _x == _side} count playableUnits) + (count _waitingPlayersArray)) < _waveSize) then {
    [grad_waverespawn_fnc_checkEnoughForWave,[_side,_iteration + 1],5] call CBA_fnc_waitAndExecute;
};
