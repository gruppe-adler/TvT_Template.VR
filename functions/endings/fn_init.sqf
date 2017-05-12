#include "component.hpp"

private _winConditions = "true" configClasses (missionConfigFile >> "CfgWinConditions");

{
    _preset = [_x,"preset",""] call BIS_fnc_returnConfigEntry;
    if (_preset == "") then {
        [_x] call grad_endings_fnc_startWincondition;
    } else {
        [_x] call grad_endings_fnc_startPreset;
    };

    false
} count _winConditions;
