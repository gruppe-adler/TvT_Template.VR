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