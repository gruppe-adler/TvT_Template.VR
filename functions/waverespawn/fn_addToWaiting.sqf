#include "component.hpp"

params ["_deadPlayer",["_deadPlayerSide", sideUnknown],["_add",true]];

if (isNil "waitingPlayersBlu") then {waitingPlayersBlu = []};
if (isNil "waitingPlayersOpf") then {waitingPlayersOpf = []};
if (isNil "waitingPlayersInd") then {waitingPlayersInd = []};

//add player to array
private _array = switch (_deadPlayerSide) do {
    case (WEST): {waitingPlayersBlu};
    case (EAST): {waitingPlayersOpf};
    case (INDEPENDENT): {waitingPlayersInd};
    default {[]};
};

if (_add) then {
    _array pushBackUnique _deadPlayer
} else {
    _id = _array find _deadPlayer;
    while {_id >= 0} do {
        _array deleteAt _id;
        _id = _array find _deadPlayer;
    };
};

[_deadPlayerSide] call grad_waverespawn_fnc_checkEnoughForWave;
