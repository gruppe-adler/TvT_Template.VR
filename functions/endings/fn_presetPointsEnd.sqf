#include "component.hpp"

params ["_winName","_side"];

private _otherSides = [WEST,EAST,INDEPENDENT,CIVILIAN] - [_side];

private _sidePoints = [_side] call grad_points_fnc_getPoints;
private _otherPoints = _otherSides apply {[_x] call grad_points_fnc_getPoints};
private _moreThanCount = {_sidePoints > _x} count _otherPoints;

private _isDraw = false;
if (_moreThanCount < 3 && {_sidePoints == selectMax _otherPoints}) then {
    _isDraw = _otherPoints find _sidePoints != -1;
};

if (!_isDraw && _moreThanCount < 3) exitWith {};

if (missionNamespace getVariable ["grad_endings_presetPoints_endInProgress",false]) exitWith {};
missionNamespace setVariable ["grad_endings_presetPoints_endInProgress",true];

[] call grad_points_fnc_displayPoints;

private _winParams = [_winName];
if (_isDraw) then {
    _winParams = _winParams + ["Time is up. No winner by points.",[WEST,EAST,INDEPENDENT,CIVILIAN]];
};

[{_this call grad_endings_fnc_endMissionServer}, _winParams, 15] call CBA_fnc_waitAndExecute;
