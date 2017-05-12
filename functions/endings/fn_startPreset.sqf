#include "component.hpp"

params ["_winCondition"];

private _preset = [_winCondition,"preset",""] call BIS_fnc_returnConfigEntry;
private _presetParams = ([_winCondition,"presetParams",[]] call BIS_fnc_returnConfigEntry) apply {call compile _x};
private _winName = configName _winCondition;

INFO_1("Initialized preset %1.",_preset);

switch (_preset) do {
    case ("ELIMINATION"): {
        [_winName,_presetParams select 0] call grad_endings_fnc_presetElimination;
    };
};
