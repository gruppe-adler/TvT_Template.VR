#include "component.hpp"

params ["_side"];

_status = "";

if (_side == WEST) then {
    _status = switch (true) do {
        case (GVAR(WAVERESPAWNTIMELEFTBLU) > 0): {
            "Waiting for wave-countdown.";
        };
        case (count GVAR(wavePlayersBlu) < GVAR(BLUFORWAVESIZE)): {
            "Waiting for more players.";
        };
        default {
            "Preparing respawn...";
        };
    };
};

if (_side == EAST) then {
    _status = switch (true) do {
        case (GVAR(OPFORWAVESIZE) > 0): {
            "Waiting for wave-countdown.";
        };
        case (count GVAR(wavePlayersOpf) < GVAR(OPFORWAVESIZE)): {
            "Waiting for more players.";
        };
        default {
            "Preparing respawn...";
        };
    };
};

if (_side == INDEPENDENT) then {
    _status = switch (true) do {
        case (GVAR(INDEPWAVESIZE) > 0): {
            "Waiting for wave-countdown.";
        };
        case (count GVAR(wavePlayersInd) < GVAR(INDEPWAVESIZE)): {
            "Waiting for more players.";
        };
        default {
            "Preparing respawn...";
        };
    };
};


_status
