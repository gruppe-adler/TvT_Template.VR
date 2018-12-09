#include "component.hpp"

params [["_trigger",objNull],["_block",true],["_showHint",true]];

_captureSides = _x getVariable [QGVAR(captureSides),[]];
{
    _task = _trigger getVariable [format ["grad_sectors_task_%1",_x],""];
    _taskState = ["ASSIGNED","CANCELED"] select _block;
    [_task,_taskState,_showHint] call BIS_fnc_taskSetState;
} forEach _captureSides;

_trigger setVariable [QGVAR(blocked),_block];
