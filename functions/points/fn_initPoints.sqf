#include "component.hpp"

private _cfg = missionConfigFile >> "CfgPoints";
private _sideToStr = [
    [west, "BLUFOR"],
    [east, "OPFOR"],
    [independent, "INDEPENDENT"]
];

// this is a map<event:STRING,map<side:SIDE,bounty:SCALAR>>
ISNILS(GVAR(bounties), createHashMap);
{
    private _event = _x;
    private _event_default = [_cfg, _event] call BIS_fnc_returnConfigEntry;
    private _hash = createHashMapFromArray [
        _sideToStr apply {
            [_x#0, [_cfg >> _x#1, _event, _event_default] call BIS_fnc_returnConfigEntry],
        },
        0
    ];
    GVAR(bounties) set [_event, _hash];
} forEach [
    "playerKilled",
    "aiKilled",
    "civKilled"
];

// this is a map<side:SIDE,map<category:STRING,points:SCALAR>>
ISNILS(GVAR(points), createHashMap);

[] call grad_points_fnc_addKilledEH;
