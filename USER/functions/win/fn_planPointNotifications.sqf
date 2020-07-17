#include "component.hpp"

assert(isServer);

{
    [
        {
            [
                "mission_points",
                [
                    [east] call grad_points_fnc_getPoints,
                    [west] call grad_points_fnc_getPoints
                ]
            ] call CBA_fnc_globalEvent;
        },
        [],
        _x
    ] call CBA_fnc_waitAndExecute;
} forEach [
    MISSION_timeout * 0.25,
    MISSION_timeout * 0.5,
    MISSION_timeout * 0.75
]
