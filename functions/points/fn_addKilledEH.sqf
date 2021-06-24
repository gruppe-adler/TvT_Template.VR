#include "component.hpp"

private _handle = QGVAR(playerKilledEH);
private _code = {
    params ["_victim","_victimSide","_victimIsPlayer","_killer","_killerSide","_killerIsPlayer","_killTime"];

    if (_killerSide == CIVILIAN) exitWith {};
    if (_victim == _killer) exitWith {};

    private _eventAndCategory = switch (true) do {
        case (_victimSide == CIVILIAN): {
            ["civKilled", "Civilians killed"]
        };
        case (_victimSide getFriend _killerSide >= 0.6): {
            ["", ""]
        };
        case (_victimIsPlayer): {
            ["playerKilled", "Players killed"]
        };
        default {
            ["aiKilled", "AI killed"]
        };
    };

    private _bounty = (GVAR(bounties) getOrDefault [_eventAndCategory#0, createHashMap]) getOrDefault [_killerSide, 0];
    if (_bounty isNotEqualTo 0) then {
        INFO_3("adding %1 points to %2 in category %3", _bounty, _killerSide, _eventAndCategory#1);
        [_killerSide,_bounty,_eventAndCategory#1] call FUNC(addPoints);
    };
};

[_handle,_code] call EFUNC(common,addUnitKilledEH);
