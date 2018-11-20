#include "component.hpp"

params ["_deadPlayer", ["_deadPlayerSide", sideUnknown]];

if (isNil "wavePlayersBlu") then {wavePlayersBlu = []};
if (isNil "wavePlayersOpf") then {wavePlayersOpf = []};
if (isNil "wavePlayersInd") then {wavePlayersInd = []};

//add player to array
switch (_deadPlayerSide) do {
    case (WEST): {
        wavePlayersBlu pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to wavePlayersBlu. %2 dead blufor total.", _deadPlayer, count wavePlayersBlu);
        WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count wavePlayersBlu);
        publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
    };
    case (EAST): {
        wavePlayersOpf pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to wavePlayersOpf. %2 dead opfor total.", _deadPlayer, count wavePlayersOpf);
        WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count wavePlayersOpf);
        publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
    };
    case (INDEPENDENT): {
        wavePlayersInd pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to wavePlayersOpf. %2 dead opfor total.", _deadPlayer, count wavePlayersInd);
        WAVERESPAWNPLAYERSLEFTIND = INDEPWAVESIZE - (count wavePlayersInd);
        publicVariable "WAVERESPAWNPLAYERSLEFTIND";
    };
    default {
        ERROR_1("Unknown side for player %1", _deadPlayer);
    };
};
