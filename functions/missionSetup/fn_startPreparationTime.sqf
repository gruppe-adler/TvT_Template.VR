#include "component.hpp"

params [["_preparationTime",0],["_onComplete",{}]];

if (_preparationTime <= 0) exitWith {};
_preparationTime = _preparationTime max 5;

[{
    params ["_args","_handle"];
    _args params [["_preparationTime",0],["_onComplete",{}]];

    [_preparationTime] remoteExec ["grad_missionSetup_fnc_preparationTimeCountdown",0,false];

    if (_preparationTime <= 0) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [] call _onComplete;
    };

    if (EGVAR(common,gamePaused)) exitWith {};
    _args set [0,_preparationTime - 1];

},1,[_preparationTime,_onComplete]] call CBA_fnc_addPerFrameHandler;
