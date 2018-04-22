#include "component.hpp"

if (!isServer) exitWith {};

params ["_logic",["_sectorName","UNKNOWN SECTOR"],["_getPointsForCapture", 1, [0, {}]],["_pointsPerSecond",0],["_lockAfterCapture",false],["_captureSides",[WEST,EAST,INDEPENDENT]],["_owner",sideUnknown]];

if !(_logic isKindOf "LocationArea_F") exitWith {ERROR_1("%1 is not an area logic.",_logic)};

if (typeName _getPointsForCapture == "SCALAR") then {
  _getPointsForCapture = compile str _getPointsForCapture;
};

if (isNil "grad_sectors_sectorTriggers") then {grad_sectors_sectorTriggers = []};

{
    [_x,_sectorName,_getPointsForCapture,_pointsPerSecond,_lockAfterCapture,_captureSides,_owner] call grad_sectors_fnc_initTrigger;
	  [_x] call grad_sectors_fnc_createMarker;
    [_x] call grad_sectors_fnc_createTasks;
    [{!isNull (_this select 0)}, {[_this select 0] call grad_sectors_fnc_startPFH}, [_x]] call CBA_fnc_waitUntilAndExecute;

    grad_sectors_sectorTriggers pushBack _x;
} foreach (_logic call bis_fnc_moduleTriggers);

INFO_1("Sector %1 initialized.",_sectorName);
