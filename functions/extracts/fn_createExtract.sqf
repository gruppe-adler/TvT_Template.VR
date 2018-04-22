#include "component.hpp"

if (!isServer) exitWith {};

params [
  "_logic",
  ["_sectorName", "UNKNOWN EXTRACT"],
  ["_getPointsForExtract", 0, [0, {}]],
  ["_extractSides", [west,east,independent]]
];

if (typeName _getPointsForExtract == "SCALAR") then {
    _getPointsForExtract = compile str _getPointsForExtract;
};

if !(_logic isKindOf "LocationArea_F") exitWith {ERROR_1("%1 is not an area logic.",_logic)};


if (isNil "grad_extracts_sectorTriggers") then {grad_extracts_sectorTriggers = []};

{
    [_x, _sectorName, _getPointsForExtract, _extractSides] call grad_extracts_fnc_initTrigger;
    [_x] call grad_extracts_fnc_createMarker;
    [_x] call grad_extracts_fnc_createTasks;

    grad_extracts_sectorTriggers pushBack _x;
} forEach (_logic call bis_fnc_moduleTriggers);

INFO_1("Extract %1 initialized.",_sectorName);
