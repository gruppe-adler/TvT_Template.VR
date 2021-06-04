#include "component.hpp"

params [
    ["_side",  sideUnknown, [sideUnknown]]
];

assert(_side in [east, west]);

private _otherSide = switch (_side) do {
    case (east): { west };
    case (west): { east };
    default { throw "logic error" };
};

private _otherSideIsEliminated = ({ (side _x == _otherSide) && ((incapacitatedState _x) in ["HEALTHY", "INJURED"]) } count allPlayers) isEqualTo [];
private _timeIsUp = ( CBA_missionTime > MISSION_timeout );
private _sideHasMorePoints = { ([_side] call grad_points_fnc_getPoints) > ([_otherSide] call grad_points_fnc_getPoints) };

if ((_otherSideIsEliminated || _timeIsUp) && _sideHasMorePoints) exitWith {
    if (_otherSideIsEliminated) then {
        INFO_1("%1 has been eliminated.", _otherSide);
    };
    if (_timeIsUp) then {
        INFO_1("time is up after %1s.", MISSION_timeout);
    };
    INFO_1("%1 has more points & wins", _side);
    true
};

false
