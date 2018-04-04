#include "component.hpp"

if (!isServer) exitWith {};

params [
  "_logic",
  ["_sectorName", "UNKNOWN EXTRACT"],
  ["_pointsForExtract", 1],
  ["_extractSides", [west,east,independent]]
];

if !(_logic isKindOf "LocationArea_F") exitWith {ERROR_1("%1 is not an area logic.",_logic)};


if (isNil "grad_extracts_sectorTriggers") then {grad_extracts_sectorTriggers = []};

{
    [_x, _sectorName, _pointsForExtract, _extractSides] call grad_extracts_fnc_initTrigger;
    if (hasInterface) then {
      [_x, if (playerSide in _extractSides)] call grad_extracts_fnc_createMarker;
    };
    [_x] call grad_extracts_fnc_createTasks;
    [{!isNull (_this select 0)}, {[_this select 0] call grad_extracts_fnc_startPFH}, [_x]] call CBA_fnc_waitUntilAndExecute;

    grad_extracts_sectorTriggers pushBack _x;
} forEach (_logic call bis_fnc_moduleTriggers);

INFO_1("Extract %1 initialized.",_sectorName);
