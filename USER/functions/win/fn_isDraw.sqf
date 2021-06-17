#include "component.hpp"


private _samePoints = ([east] call grad_points_fnc_getPoints) == ([west] call grad_points_fnc_getPoints);
if (!_samePoints) exitWith {false};

private _timeIsUp = CBA_missionTime > MISSION_timeout;

if (_timeIsUp) exitWith {
    INFO("time is up and both sides have the same number of points");
    true
};

private _noPlayersLeftAlive = ({ ((lifeState _x) in ["HEALTHY", "INJURED"]) && {(_x getVariable ["ace_spectator_isSet", false]) isEqualTo false}} count PLAYABLE_UNITS) isEqualTo 0;
private _someHaveExtracted  = (count GVAR(extractedPlayers)) > 0;

if (_noPlayersLeftAlive && _someHaveExtracted) exitWith {
    INFO("everyone alive has extracted, and both sides have the same number of points");
    true
};

false
