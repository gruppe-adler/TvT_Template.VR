#include "component.hpp"

params ["_side"];

_status = "";

if (_side == WEST) then {
    _status = switch (true) do {
        case (WAVERESPAWNTIMELEFTBLU > 0): {
            "Waiting for wave-countdown.";
        };
        case (count wavePlayersBlu < BLUFORWAVESIZE): {
            "Waiting for more players.";
        };
        default {
            "Preparing respawn...";
        };
    };
};

if (_side == EAST) then {
    _status = switch (true) do {
        case (OPFORWAVESIZE > 0): {
            "Waiting for wave-countdown.";
        };
        case (count wavePlayersOpf < OPFORWAVESIZE): {
            "Waiting for more players.";
        };
        default {
            "Preparing respawn...";
        };
    };
};

if (_side == INDEPENDENT) then {
    _status = switch (true) do {
        case (INDEPWAVESIZE > 0): {
            "Waiting for wave-countdown.";
        };
        case (count wavePlayersInd < INDEPWAVESIZE): {
            "Waiting for more players.";
        };
        default {
            "Preparing respawn...";
        };
    };
};


_status
