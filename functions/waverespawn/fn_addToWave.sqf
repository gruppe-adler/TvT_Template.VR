#include "component.hpp"

params ["_deadPlayer", ["_deadPlayerSide", sideUnknown]];

if (isNil QGVAR(wavePlayersBlu)) then {GVAR(wavePlayersBlu) = []};
if (isNil QGVAR(wavePlayersOpf)) then {GVAR(wavePlayersOpf) = []};
if (isNil QGVAR(wavePlayersInd)) then {GVAR(wavePlayersInd) = []};
if (isNil QGVAR(wavePlayersCiv)) then {GVAR(wavePlayersCiv) = []};

//add player to array
switch (_deadPlayerSide) do {
    case (WEST): {
        GVAR(wavePlayersBlu) pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to wavePlayersBlu. %2 dead blufor total.", _deadPlayer, count GVAR(wavePlayersBlu));
        GVAR(WAVERESPAWNPLAYERSLEFTBLU) = GVAR(BLUFORWAVESIZE) - (count GVAR(wavePlayersBlu));
        publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTBLU);
    };
    case (EAST): {
        GVAR(wavePlayersOpf) pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to wavePlayersOpf. %2 dead opfor total.", _deadPlayer, count GVAR(wavePlayersOpf));
        GVAR(WAVERESPAWNPLAYERSLEFTOPF) = GVAR(OPFORWAVESIZE) - (count GVAR(wavePlayersOpf));
        publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTOPF);
    };
    case (INDEPENDENT): {
        GVAR(wavePlayersInd) pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to wavePlayersInd. %2 dead independent total.", _deadPlayer, count GVAR(wavePlayersInd));
        GVAR(WAVERESPAWNPLAYERSLEFTIND) = GVAR(INDEPWAVESIZE) - (count GVAR(wavePlayersInd));
        publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTIND);
    };
    case (CIVILIAN): {
        GVAR(wavePlayersCiv) pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to wavePlayersCiv. %2 dead civilian total.", _deadPlayer, count GVAR(wavePlayersCiv));
        GVAR(WAVERESPAWNPLAYERSLEFTCIV) = GVAR(CIVWAVESIZE) - (count GVAR(wavePlayersCiv));
        publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTCIV);
    };
    default {
        ERROR_1("Unknown side for player %1", _deadPlayer);
    };
};
