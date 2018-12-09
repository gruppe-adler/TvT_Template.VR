#include "component.hpp"

params ["_trigger",["_showHint",true]];

private _captureSides = _trigger getVariable "grad_sectors_captureSides";
private _owner = _trigger getVariable "grad_sectors_currentOwner";
private _previousOwner = _trigger getVariable "grad_sectors_previousOwner";
private _lockAfterCapture = _trigger getVariable "grad_sectors_lockAfterCapture";

private _sectorName = _trigger getVariable "grad_sectors_sectorName";
if (_sectorName == "") then {_sectorName = "the sector"};

private _defendDescription = [format ["Defend %1.",_sectorName],"Defend",""];
private _attackDescription = [format ["Capture %1.",_sectorName],"Capture",""];

if (_lockAfterCapture) then {
    {
        _task = _trigger getVariable (format ["grad_sectors_task_%1",_x]);
        _state = if (_x == _owner) then {"Succeeded"} else {"Failed"};
        [_task,_state,_showHint] spawn BIS_fnc_taskSetState;

        false
    } count _captureSides;
} else {
    {
        _description = if (_x == _owner) then {_defendDescription} else {_attackDescription};
        _marker = if (_x == _owner) then {"defend"} else {"attack"};

        if (_previousOwner != sideUnknown || _marker == "defend") then {
            _task = _trigger getVariable (format ["grad_sectors_task_%1",_x]);
            [_task,_description] call FUNC(taskSetDescription);
            [_task,_marker] call BIS_fnc_taskSetType;
        };

        false
    } count _captureSides;
};
