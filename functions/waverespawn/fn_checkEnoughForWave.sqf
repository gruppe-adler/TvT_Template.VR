/* sets respawn interrupted, if remaining players are not enough for a full wave
*/

#include "component.hpp"

params ["_side",["_iteration",0]];

private _waitingPlayersArray = switch (_side) do {
    case (WEST): {GVAR(waitingPlayersBlu)};
    case (EAST): {GVAR(waitingPlayersOpf)};
    case (INDEPENDENT): {GVAR(waitingPlayersInd)};
    default {[]};
};


// exit here if it's the second iteration (so players have either been dead or unconscious for 10s)
if (_iteration == 2) exitWith {
    {
        _x setVariable ["wr_interrupted",true,true];
    } forEach _waitingPlayersArray;
};


private _waveSize = switch (_side) do {
    case (WEST): {GVAR(BLUFORWAVESIZE)};
    case (EAST): {GVAR(OPFORWAVESIZE)};
    case (INDEPENDENT): {GVAR(INDEPWAVESIZE)};
    default {-1};
};
if (_waveSize < 0) exitWith {};


if ((({side _x == _side} count playableUnits) + (count _waitingPlayersArray)) < _waveSize) then {
    [FUNC(checkEnoughForWave),[_side,_iteration + 1],5] call CBA_fnc_waitAndExecute;
};
