#include "component.hpp"

params ["_deadPlayerName", ["_deadPlayerSide", sideUnknown]];

if (isNil "wavePlayernamesBlu") then {wavePlayernamesBlu = []};
if (isNil "wavePlayernamesOpf") then {wavePlayernamesOpf = []};
if (isNil "wavePlayernamesInd") then {wavePlayernamesInd = []};

_deadPlayerName = [_deadPlayerName] call BIS_fnc_filterString;

//add player to array
switch (_deadPlayerSide) do {
    case (WEST): {
        wavePlayernamesBlu pushBackUnique _deadPlayerName;
        INFO_2("Added player %1 to wavePlayernamesBlu. %2 dead blufor total.", _deadPlayerName, count wavePlayernamesBlu);
        WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count wavePlayernamesBlu);
        publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
    };
    case (EAST): {
        wavePlayernamesOpf pushBackUnique _deadPlayerName;
        INFO_2("Added player %1 to wavePlayernamesOpf. %2 dead opfor total.", _deadPlayerName, count wavePlayernamesOpf);
        WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count wavePlayernamesOpf);
        publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
    };
    case (INDEPENDENT): {
        wavePlayernamesInd pushBackUnique _deadPlayerName;
        INFO_2("Added player %1 to wavePlayernamesOpf. %2 dead opfor total.", _deadPlayerName, count wavePlayernamesInd);
        WAVERESPAWNPLAYERSLEFTIND = INDEPWAVESIZE - (count wavePlayernamesInd);
        publicVariable "WAVERESPAWNPLAYERSLEFTIND";
    };
    default {
        ERROR_1("Unknown side for player %1", _deadPlayerName);
    };
};
