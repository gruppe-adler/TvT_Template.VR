#include "component.hpp"

params ["_winCondition"];

private _preset = [_winCondition,"preset",""] call BIS_fnc_returnConfigEntry;
private _presetParams = [_winCondition,"presetParams",[]] call BIS_fnc_returnConfigEntry;;
private _winName = configName _winCondition;

INFO_2("Initializing preset %1 (%2).",_preset,_winName);

_preset = toUpper _preset;
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
    case ("POINTS"): {
        [_winName,_presetParams] call grad_endings_fnc_presetPoints;
    };
    case ("DESTROY"): {
        [_winName,_presetParams] call grad_endings_fnc_presetDestroy;
    };
    default {
        ERROR_1("Preset %1 not found!",_preset);
    };
};
