#include "component.hpp"

params [["_phase3Threshold",1]];

GVAR(phase3Threshold) = _phase3Threshold;

[{missionNamespace getVariable ["GRAD_MISSIONSTARTED",false] && (missionNamespace getVariable ["CBA_missionTime",0]) > 5},{

    [WEST,0] call FUNC(createTasks);
    [EAST,0] call FUNC(createTasks);

},[]] call CBA_fnc_waitUntilAndExecute;
