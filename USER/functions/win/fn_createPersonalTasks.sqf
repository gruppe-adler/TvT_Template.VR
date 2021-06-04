#include "component.hpp"

assert(hasInterface);

// tasks
 [
    "stayAlive",
    player,
    ["stay alive", "no one wants to die, you included", ""],
    switch (playerSide) do {
        case (east): {trigger_south};
        case (west): { trigger_north};
        default { throw "logic error" };
    },
    "CREATED",
    1,
    false,
    false,
    "",
    false
] call BIS_fnc_setTask;

player addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    ["stayAlive", "FAILED", false] call BIS_fnc_taskSetState;
}];

["grad_endings_endingInProgress", {
    if (("stayAlive" call BIS_fnc_taskState) in ["FAILED", "SUCCEEDED"]) exitWith {};

    ["stayAlive", if (alive player) then {"SUCCEEDED"} else {"FAILED"}, false] call BIS_fnc_taskSetState;
}] call CBA_fnc_addEventHandler;