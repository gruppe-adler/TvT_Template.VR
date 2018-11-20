#include "component.hpp"

params ["_unit","_side"];

switch (_side) do {
    case (WEST): {
        if (_unit in wavePlayersBlu) then {
            wavePlayersBlu deleteAt (wavePlayersBlu find _unit);
            INFO_1("Player %1 respawned and has been removed from wavePlayersBlu.", _unit);
        } else {
            ERROR_1("Player %1 is not in wavePlayersBlu.", _unit);
        };
    };

    case (EAST): {
        if (_unit in wavePlayersOpf) then {
            wavePlayersOpf deleteAt (wavePlayersOpf find _unit);
            INFO_1("Player %1 respawned and has been removed from wavePlayersOpf.", _unit);
        } else {
            ERROR_1("Player %1 is not in wavePlayersOpf", _unit);
        };
    };

    case (INDEPENDENT): {
        if (_unit in wavePlayersInd) then {
            wavePlayersInd deleteAt (wavePlayersInd find _unit);
            INFO_1("Player %1 respawned and has been removed from wavePlayersInd.", _unit);
        } else {
            ERROR_1("Player %1 is not in wavePlayersInd", _unit);
        };
    };

    default {ERROR_1("Player %1 is neither WEST nor EAST nor INDEPENDENT.", _unit)};
};

[{
    WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count wavePlayersBlu);
    WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count wavePlayersOpf);
    WAVERESPAWNPLAYERSLEFTIND = INDEPWAVESIZE - (count wavePlayersInd);
    publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
    publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
    publicVariable "WAVERESPAWNPLAYERSLEFTIND";
}, [], (RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitAndExecute;
