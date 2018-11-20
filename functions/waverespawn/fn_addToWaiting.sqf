#include "component.hpp"

params ["_deadPlayer",["_deadPlayerSide", sideUnknown],["_add",true]];

if (isNil QGVAR(waitingPlayersBlu)) then {GVAR(waitingPlayersBlu) = []};
if (isNil QGVAR(waitingPlayersOpf)) then {GVAR(waitingPlayersOpf) = []};
if (isNil QGVAR(waitingPlayersInd)) then {GVAR(waitingPlayersInd) = []};

//add player to array
private _array = switch (_deadPlayerSide) do {
    case (WEST): {GVAR(waitingPlayersBlu)};
    case (EAST): {GVAR(waitingPlayersOpf)};
    case (INDEPENDENT): {GVAR(waitingPlayersInd)};
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

[_deadPlayerSide] call FUNC(checkEnoughForWave);
