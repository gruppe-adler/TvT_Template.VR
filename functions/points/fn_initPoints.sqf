#include "component.hpp"

if (isNil "CBA_fnc_hashValues") then { // https://github.com/CBATeam/CBA_A3/pull/1350
    CBA_fnc_hashValues = {+((_this#0) select 2)};
};

private _cfg = missionConfigFile >> "CfgPoints";
private _sideToStr = [
    [west, "BLUFOR"],
    [east, "OPFOR"],
    [independent, "INDEPENDENT"]
];

// this is a map<event:STRING,map<side:SIDE,bounty:SCALAR>>
ISNILS(GVAR(bounties), [ARR_2([], [ARR_2([], 0)] call CBA_fnc_hashCreate)] call CBA_fnc_hashCreate);
{
    private _event = _x;
    private _event_default = [_cfg, _event] call BIS_fnc_returnConfigEntry;
    private _hash = [
        _sideToStr apply {
            [_x#0, [_cfg >> _x#1, _event, _event_default] call BIS_fnc_returnConfigEntry],
        },
        0
    ] call CBA_fnc_hashCreate;
    [GVAR(bounties), _event, _hash] call CBA_fnc_hashSet;
} forEach [
    "playerKilled",
    "aiKilled",
    "civKilled"
];

// this is a map<side:SIDE,map<category:STRING,points:SCALAR>>
ISNILS(GVAR(points), createHashMap);

[] call grad_points_fnc_addKilledEH;
