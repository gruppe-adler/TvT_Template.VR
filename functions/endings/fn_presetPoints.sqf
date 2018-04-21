#include "component.hpp"

params ["_winName","_presetParams"];

_presetParams params ["_side",["_pointThreshold", 9999, [0, ""]],["_timeout",99999]];
_side = call compile _side;

if (typeName _pointThreshold == "SCALAR") then {
  _pointThreshold = str _pointThreshold;
};
_pointThreshold = compile _pointThreshold;

private _startTime = CBA_missionTime;
[{
    params ["_args","_handle"];
    _args params ["_winName","_side","_pointThreshold","_timeout","_startTime"];

    private _currentThreshold = [] call _pointThreshold;
    private _sidePoints = [_side] call grad_points_fnc_getPoints;
    if (
      CBA_missionTime - _startTime > _timeout
      || _sidePoints >= _currentThreshold
    ) exitWith {
        [_winName,_side] call grad_endings_fnc_presetPointsEnd;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
},2,[_winName,_side,_pointThreshold,_timeout,_startTime]] call CBA_fnc_addPerFrameHandler;
