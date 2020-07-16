#include "component.hpp"

assert(isServer);

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
