#include "component.hpp"

if (!isServer) exitWith {};
if !(_logic isKindOf "LocationArea_F") exitWith {ERROR_1("%1 is not an area logic.",_logic)};

params ["_logic",["_sectorName",""],["_pointsForCapture",1],["_pointsPerSecond",0],["_lockAfterCapture",false],["_captureSides",[WEST,EAST,INDEPENDENT]],["_owner",sideUnknown]];

{
    [_x,_sectorName,_pointsForCapture,_pointsPerSecond,_lockAfterCapture,_captureSides,_owner] call grad_sectors_fnc_initTrigger;
	[_x] call grad_sectors_fnc_createMarker;
    [_x] call grad_sectors_fnc_createTasks;
    [{!isNull (_this select 0)}, {[_this select 0] call grad_sectors_fnc_startPFH}, [_x]] call CBA_fnc_waitUntilAndExecute;

} foreach (_logic call bis_fnc_moduleTriggers);