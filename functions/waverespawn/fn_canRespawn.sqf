#include "component.hpp"

params ["_side"];

_canRespawn = switch (_side) do {
    case ("WEST"): {
        count GVAR(wavePlayersBlu) >= GVAR(BLUFORWAVESIZE) &&
        GVAR(WAVERESPAWNTIMELEFTBLU) <= 0
    };
    case ("EAST"): {
        count GVAR(wavePlayersOpf) >= GVAR(OPFORWAVESIZE) &&
        GVAR(WAVERESPAWNTIMELEFTOPF) <= 0
    };
    case ("INDEPENDENT"): {
        count GVAR(wavePlayersInd) >= GVAR(INDEPWAVESIZE) &&
        GVAR(WAVERESPAWNTIMELEFTIND) <= 0
    };
    default {
        false
    };
};

_canRespawn
