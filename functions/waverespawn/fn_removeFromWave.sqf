#include "component.hpp"

params ["_unit","_side"];

switch (_side) do {
    case (WEST): {
        if (_unit in GVAR(wavePlayersBlu)) then {
            GVAR(wavePlayersBlu) deleteAt (GVAR(wavePlayersBlu) find _unit);
            INFO_1("Player %1 respawned and has been removed from wavePlayersBlu.", _unit);
        } else {
            ERROR_1("Player %1 is not in wavePlayersBlu.", _unit);
        };
    };

    case (EAST): {
        if (_unit in GVAR(wavePlayersOpf)) then {
            GVAR(wavePlayersOpf) deleteAt (GVAR(wavePlayersOpf) find _unit);
            INFO_1("Player %1 respawned and has been removed from wavePlayersOpf.", _unit);
        } else {
            ERROR_1("Player %1 is not in wavePlayersOpf", _unit);
        };
    };

    case (INDEPENDENT): {
        if (_unit in GVAR(wavePlayersInd)) then {
            GVAR(wavePlayersInd) deleteAt (GVAR(wavePlayersInd) find _unit);
            INFO_1("Player %1 respawned and has been removed from wavePlayersInd.", _unit);
        } else {
            ERROR_1("Player %1 is not in wavePlayersInd", _unit);
        };
    };

    default {ERROR_1("Player %1 is neither WEST nor EAST nor INDEPENDENT.", _unit)};
};

[{
    GVAR(WAVERESPAWNPLAYERSLEFTBLU) = GVAR(BLUFORWAVESIZE) - (count GVAR(wavePlayersBlu));
    GVAR(WAVERESPAWNPLAYERSLEFTOPF) = GVAR(OPFORWAVESIZE) - (count GVAR(wavePlayersOpf));
    GVAR(WAVERESPAWNPLAYERSLEFTIND) = GVAR(INDEPWAVESIZE) - (count GVAR(wavePlayersInd));
    publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTBLU);
    publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTOPF);
    publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTIND);
}, [], (GVAR(RESPAWNWAVEEXTRATIME) max 7)] call CBA_fnc_waitAndExecute;
