#include "component.hpp"

params ["_winName","_sides"];
_sides = _sides apply {call compile _x};

[{
    params ["_args","_handle"];
    _args params ["_winName","_sides"];

    if ({_side = _x; ({side _x == _side} count playableUnits) > 0} count _sides == 0) exitWith {

        [{
            params ["_winName","_sides"];
            if ({_side = _x; ({side _x == _side} count playableUnits) > 0} count _sides == 0) then {
                [_winName] call grad_endings_fnc_endMissionServer;
            } else {
                _this call grad_endings_fnc_presetElimination;
            };
        }, [_winName,_sides], 10] call CBA_fnc_waitAndExecute;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
},10,[_winName,_sides]] call CBA_fnc_addPerFrameHandler;
