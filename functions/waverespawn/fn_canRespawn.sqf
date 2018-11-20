#include "component.hpp"

params ["_side"];

_canRespawn = switch (_side) do {
    case ("WEST"): {
        count wavePlayersBlu >= BLUFORWAVESIZE &&
        WAVERESPAWNTIMELEFTBLU <= 0
    };
    case ("EAST"): {
        count wavePlayersOpf >= OPFORWAVESIZE &&
        WAVERESPAWNTIMELEFTOPF <= 0
    };
    case ("INDEPENDENT"): {
        count wavePlayersInd >= INDEPWAVESIZE &&
        WAVERESPAWNTIMELEFTIND <= 0
    };
    default {
        false
    };
};

_canRespawn
