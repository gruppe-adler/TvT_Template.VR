/*  Workaround for bis_fnc_setTask forcing notifications
 *
 */

#include "component.hpp"

private ["_taskID","_info"];

_taskID = _this param [0,"",[""]];
_info = _this param [1,["","",""],[[]], 3];

[_taskID,nil,_info,nil,nil,nil,false] call bis_fnc_setTask;
