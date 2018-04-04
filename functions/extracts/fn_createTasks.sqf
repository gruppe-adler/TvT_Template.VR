#include "component.hpp"

params ["_trigger"];

private _extractSides = _trigger getVariable "grad_extracts_extractSides";
private _sectorName = _trigger getVariable "grad_extracts_sectorName";
if (_sectorName == "") then {_sectorName = "the extract"};

private _extractDescription = [format ["Extract at %1.",_sectorName],"Extract",""];
private _preventDescription = [format ["Prevent enemy extraction at %1", _sectorName], "Prevent", ""];

{
    _description = if (_x == playerSide) then {_extractDescription} else {_attackDescription};
    _marker = if (_x == playerSide) then {"extract"} else {"prevent"};
    _task = [_x,format ["grad_extracts_task_%1_%2",_x,getPos _trigger],_description,getPos _trigger,true,1,false,_marker,true] call BIS_fnc_taskCreate;

    _trigger setVariable [format ["grad_extracts_task_%1",_x],_task];
    false
} count _extractSides;
