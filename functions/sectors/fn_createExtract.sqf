#include "component.hpp"

if (!isServer) exitWith {};

params ["_logic",["_sectorName","UNKNOWN EXTRACT"],["_pointsForExtract",1],["_extractSeparately",true],["_extractSides",[WEST,EAST,INDEPENDENT]],["_delay",0]];

if !(_logic isKindOf "LocationArea_F") exitWith {ERROR_1("%1 is not an area logic.",_logic)};


if (isNil "grad_sectors_sectorTriggers") then {grad_sectors_sectorTriggers = []};

{
    [_x,_sectorName,_pointsForExtract,_extractSeparately,_extractSides,_delay] call grad_sectors_fnc_initExtractTrigger;
	  [_x] call grad_sectors_fnc_createMarker;
    [_x] call grad_sectors_fnc_createExtractTasks;
    [{!isNull (_this select 0)}, {[_this select 0] call grad_sectors_fnc_startPFH}, [_x]] call CBA_fnc_waitUntilAndExecute;

    grad_sectors_sectorTriggers pushBack _x;
} foreach (_logic call bis_fnc_moduleTriggers);

INFO_1("Sector %1 initialized.",_sectorName);
