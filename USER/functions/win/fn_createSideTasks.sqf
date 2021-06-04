#include "component.hpp"

assert(isServer);

[east, 0, "extracted sheep"] call grad_points_fnc_addPoints;
[west, 0, "extracted sheep"] call grad_points_fnc_addPoints;
[east, 0, "sheep in FOB"] call grad_points_fnc_setPoints;
[west, 0, "sheep in FOB"] call grad_points_fnc_setPoints;


// tasks

{
    _x params ["_side", "_taskId", "_taskCfgClass"];
    [
        _side,
        _taskId,
        _taskCfgClass,
         objNull,
        "ASSIGNED",
        -1,
        false,
        "" // CfgTaskTypes
    ] call BIS_fnc_taskCreate;
} forEach [
    [east, "opfSheep", "opfMoreSheep"],
    [east, ["opfSheepFob", "opfSheep"], "opfSheepFob"],
    [east, ["opfSheepExtract", "opfSheep"], "opfSheepExtract"],
    [west, "bluSheep", "bluMoreSheep"],
    [west, ["bluSheepFob", "bluSheep"], "bluSheepFob"],
    [west, ["bluSheepExtract", "bluSheep"], "bluSheepExtract"]
];
