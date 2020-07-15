#include "component.hpp"

private _timeIsUp = CBA_missionTime > MISSION_timeout;

if (_timeIsUp) exitWith {
    INFO("time is up and both  sides have the same number of points");
    ([east] call grad_points_fnc_getPoints) == ([west] call grad_points_fnc_getPoints);
};

false
