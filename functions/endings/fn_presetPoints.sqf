#include "component.hpp"

params ["_winName","_presetParams"];

_presetParams params ["_side",["_pointThreshold",9999],["_timeout",99999]];
_side = call compile _side;

private _startTime = CBA_missionTime;
[{
    params ["_args","_handle"];
    _args params ["_winName","_side","_pointThreshold","_timeout","_startTime"];

    if (CBA_missionTime - _startTime > _timeout || [_side] call grad_points_fnc_getPoints >= _pointThreshold) exitWith {
        [_winName,_side] call grad_endings_fnc_presetPointsEnd;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
},2,[_winName,_side,_pointThreshold,_timeout,_startTime]] call CBA_fnc_addPerFrameHandler;
