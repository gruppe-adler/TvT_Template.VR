#include "component.hpp"

[{
    params ["_args","_handle"];
    _args params ["_trigger"];

    if (missionNamespace getVariable [QEGVAR(common,gamePaused),false]) exitWith {};
    if !(missionNamespace getVariable ["GRAD_MISSIONSTARTED",false]) exitWith {};

    _side = _trigger getVariable QGVAR(fobSide);
    _unitsInTrigger = list _trigger;

    if ((independent countSide _unitsInTrigger) == 0 && {(_side countSide _unitsInTrigger) > 0}) then {
        [_trigger] call FUNC(onFobCaptured);
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},5,_this] call CBA_fnc_addPerFrameHandler;
