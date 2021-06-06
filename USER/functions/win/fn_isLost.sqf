#include "component.hpp"


// TODO: take care - this is only if all players *died* and *none* extracted

private _noPlayersLeft = ({ (incapacitatedState _x) in ["HEALTHY", "INJURED"]} count allPlayers) isEqualTo [];

if (_noPlayersLeft) then {
    INFO("no side has players left. points count now.");
};

_noPlayersLeft;
