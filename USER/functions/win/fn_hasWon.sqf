#include "component.hpp"

params [
    ["_side",  sideUnknown, [sideUnknown]]
];

assert(_side in [east, west]);

private _otherSide = case (_side): {
    case (east): { west };
    case (west): { east };
    default { throw "logic error" };
};


// other side is eliminated? if yes, points rule.

private _otherSideIsEliminated = ({ (side _x == _otherSide) && ((incapacitatedState _x) in ["HEALTHY", "INJURED"]) } count allPlayers) isEqualTo [];
private _timeIsUp = CBA_missionTime > MISSION_timeout;

if (_otherSideIsEliminated) then {
    INFO_1("%1 has been eliminated", _otherSide);
};
if (_timeIsUp) then {
    INFO_1("time is up after %1s", MISSION_timeout);
};

if (_otherSideIsEliminated || _timeIsUp) exitWith {
    private _win = ([_side] call grad_points_fnc_getPoints) > ([_otherSide] call grad_points_fnc_getPoints);
    if (_win) then {
        
        INFO_1("%1 has won", _side);
    };
    _win
};

false
