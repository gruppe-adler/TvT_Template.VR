#include "component.hpp"

_this spawn {
    params [["_preparationTime",0]];

    if (_preparationTime > 0) then {
        while {_preparationTime > -1} do {
            [_preparationTime] remoteExec ["grad_missionSetup_fnc_preparationTimeCountdown",0,false];
            _preparationTime = _preparationTime - 1;
            sleep 1;
        };
    };

    missionNamespace setVariable ["GRAD_MISSIONSTARTED",true,true];
};
