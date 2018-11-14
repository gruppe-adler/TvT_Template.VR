#include "component.hpp"

params ["_side"];

_canRespawn = switch (_side) do {
    case ("WEST"): {
        count wavePlayernamesBlu >= BLUFORWAVESIZE &&
        WAVERESPAWNTIMELEFTBLU <= 0
    };
    case ("EAST"): {
        count wavePlayernamesOpf >= OPFORWAVESIZE &&
        WAVERESPAWNTIMELEFTOPF <= 0
    };
    case ("INDEPENDENT"): {
        count wavePlayernamesInd >= INDEPWAVESIZE &&
        WAVERESPAWNTIMELEFTIND <= 0
    };
    default {
        false
    };
};

_canRespawn
