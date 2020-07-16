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
    [east, ["opfSheep", "opfSheepFob"], "opfSheepFob"],
    [east, ["opfSheep", "opfSheepExtract"], "opfSheepExtract"],
    [west, "bluSheep", "bluMoreSheep"],
    [west, ["bluSheep", "bluSheepFob"], "bluSheepFob"],
    [west, ["bluSheep", "bluSheepExtract"], "bluSheepExtract"]
];

["mission_news", {
   params ["_type","_side"];
   if (_type == "army_retaliation") then {
        private _id = switch (_side) do {
            case (east): {"opfSheepFob"};
            case (west): {"bluSheepFob"};
            default { throw "logic error"};
        };
        [_id, "CANCELED", true] call BIS_fnc_taskSetState;
   };
}] call CBA_fnc_addEventHandler;
