#include "component.hpp"

params ["_winName","presetParams"];
_presetParams params [["_trigger","objNull"],["_side","WEST"],["_timeout",0]];

_trigger = call compile _trigger;
_side = call compile _side;

if (isNull _trigger) exitWith {ERROR("Preset CONTROL: Trigger is null.")};

private _activationName = switch (_side) do {
    case (WEST): {"WEST SEIZED"};
    case (EAST): {"EAST SEIZED"};
    case (INDEPENDENT): {"GUER SEIZED"};
    default {""};
};

if (_activationName == "") exitWith {
    ERROR_1("Wrong preset parameter: side %1",_side);
};

_trigger setTriggerActivation [_activationName, "PRESENT", false];
_trigger setTriggerTimeout [_timeout, _timeout, _timeout, true];
_trigger setTriggerStatements ["this", format ["['%1'] call grad_endings_fnc_endMissionServer",_winName], ""];
