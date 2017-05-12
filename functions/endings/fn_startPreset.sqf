#include "component.hpp"

params ["_winCondition"];

private _preset = [_winCondition,"preset",""] call BIS_fnc_returnConfigEntry;
private _presetParams = [_winCondition,"presetParams",[]] call BIS_fnc_returnConfigEntry;;
private _winName = configName _winCondition;

INFO_1("Initializing preset %1.",_preset);

switch (_preset) do {
    case ("ELIMINATION"): {
        [_winName,_presetParams] call grad_endings_fnc_presetElimination;
    };
    case ("CONTROL"): {
        [_winName,_presetParams] call grad_endings_fnc_presetControl;
    };
    case ("TIMEOUT"): {
        [_winName,_presetParams] call grad_endings_fnc_presetTimeout;
    };
    default {
        ERROR_1("Preset %1 not found!",_preset);
    };
};
