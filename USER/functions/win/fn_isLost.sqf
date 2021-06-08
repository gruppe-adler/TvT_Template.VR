#include "component.hpp"

// TODO: take care - this is only if all players *died* and *none* extracted

private _noPlayersLeft = ({ (lifeState _x) in ["HEALTHY", "INJURED"]} count PLAYABLE_UNITS) isEqualTo 0;

if (_noPlayersLeft) then {
    INFO("no side has players left. points count now.");
};

_noPlayersLeft;
