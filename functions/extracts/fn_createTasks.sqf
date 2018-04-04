#include "component.hpp"

params ["_trigger"];

private _captureSides = _trigger getVariable "grad_sectors_captureSides";
private _owner = _trigger getVariable "grad_sectors_currentOwner";

private _sectorName = _trigger getVariable "grad_sectors_sectorName";
if (_sectorName == "") then {_sectorName = "the sector"};

private _defendDescription = [format ["Defend %1.",_sectorName],"Defend",""];
private _attackDescription = [format ["Capture %1.",_sectorName],"Capture",""];

{
    _description = if (_x == _owner) then {_defendDescription} else {_attackDescription};
    _marker = if (_x == _owner) then {"defend"} else {"attack"};
    _task = [_x,format ["grad_sectors_task_%1_%2",_x,getPos _trigger],_description,getPos _trigger,true,1,false,_marker,true] call BIS_fnc_taskCreate;

    _trigger setVariable [format ["grad_sectors_task_%1",_x],_task];
    false
} count _captureSides;
