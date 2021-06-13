#include "component.hpp"

assert(isServer);

[east, 0, "extracted sheep"] call grad_points_fnc_addPoints;
[west, 0, "extracted sheep"] call grad_points_fnc_addPoints;
[east, 0, "sheep in FOB"] call grad_points_fnc_setPoints;
[west, 0, "sheep in FOB"] call grad_points_fnc_setPoints;


// tasks

{
    _x params ["_side", "_taskId", "_taskCfgClass", "_taskDestination"];
    [
        _side,
        _taskId,
        _taskCfgClass,
        _taskDestination,
        "ASSIGNED",
        -1,
        false,
        "" // CfgTaskTypes
    ] call BIS_fnc_taskCreate;

} forEach [
    [east, "opfSheep", "opfMoreSheep", objNull],
    [east, ["opfSheepFob", "opfSheep"], "opfSheepFob", pen_opf],
    [east, ["opfSheepExtract", "opfSheep"], "opfSheepExtract", markerPos "border_south"],
    [west, "bluSheep", "bluMoreSheep", objNull],
    [west, ["bluSheepFob", "bluSheep"], "bluSheepFob", pen_blu],
    [west, ["bluSheepExtract", "bluSheep"], "bluSheepExtract", markerPos "border_north"]
];

[
    "grad_endings_endingInProgress", 
    {
        params ["_winConfigName"];
        
        {
            [_x, "CANCELED", false] call BIS_fnc_taskSetState;            
        } forEach ["bluSheepFob", "bluSheepExtract", "opfSheepFob", "opfSheepExtract"];
        
        switch (_winConfigName) do {
            case "opforWins": {
                ["opfSheep", "SUCCEEDED", false] call BIS_fnc_taskSetState;
                ["bluSheep", "FAILED", false] call BIS_fnc_taskSetState;
            };
            case "bluforWins": {
                ["bluSheep", "SUCCEEDED", false] call BIS_fnc_taskSetState;
                ["opfSheep", "FAILED", false] call BIS_fnc_taskSetState;
            };
            case "isDraw": {
                ["bluSheep", "FAILED", false] call BIS_fnc_taskSetState;
                ["opfSheep", "FAILED", false] call BIS_fnc_taskSetState;
            };
            case "playersLost": {
                ["bluSheep", "CANCELED", false] call BIS_fnc_taskSetState;
                ["opfSheep", "CANCELED", false] call BIS_fnc_taskSetState;
            };
            default {
                WARNING_1("unexpected winConfigName %1", _winConfigName);
            };
        };

        
    },
    []
] call CBA_fnc_addEventHandlerArgs;