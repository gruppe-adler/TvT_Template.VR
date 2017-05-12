#include "component.hpp"

params ["_winName","_side"];

[{
    params ["_args","_handle"];
    _args params ["_winName","_side"];

    if (({side _x == _side} count playableUnits) == 0) exitWith {

        [{
            params ["_winName","_side"];
            if (({side _x == _side} count playableUnits) == 0) then {
                [_winName] call grad_endings_fnc_endMissionServer;
            } else {
                _this call grad_endings_fnc_presetElimination;
            };
        }, [_winName,_side], 10] call CBA_fnc_waitAndExecute;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
},10,_this] call CBA_fnc_addPerFrameHandler;
