#include "component.hpp"

// TODO: take care - this is only if all players *died* and *none* extracted

private _noPlayersLeftAlive = ({ ((lifeState _x) in ["HEALTHY", "INJURED"]) && {(_x getVariable ["ace_spectator_isSet", false]) isEqualTo false}} count PLAYABLE_UNITS) isEqualTo 0;
private _noOneExtracted = {(count GVAR(extractedPlayers)) isEqualTo 0};

if (_noPlayersLeftAlive && _noOneExtracted) exitWith {
    INFO("no side has players left, and no-one extracted. you're dead, folks.");
    true
};

false
