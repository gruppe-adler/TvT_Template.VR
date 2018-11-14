#include "component.hpp"

params ["_unitName","_side"];

_unitName = [_unitName] call BIS_fnc_filterString;

switch (_side) do {
    case (WEST): {
        if (_unitName in wavePlayernamesBlu) then {
            wavePlayernamesBlu deleteAt (([wavePlayernamesBlu,_unitName] call BIS_fnc_arrayFindDeep) select 0);
            INFO_1("Player %1 respawned and has been removed from wavePlayernamesBlu.", _unitName);
        } else {
            ERROR_1("Player %1 is not in wavePlayernamesBlu.", _unitName);
        };
    };

    case (EAST): {
        if (_unitName in wavePlayernamesOpf) then {
            wavePlayernamesOpf deleteAt (([wavePlayernamesOpf,_unitName] call BIS_fnc_arrayFindDeep) select 0);
            INFO_1("Player %1 respawned and has been removed from wavePlayernamesOpf.", _unitName);
        } else {
            ERROR_1("Player %1 is not in wavePlayernamesOpf", _unitName);
        };
    };

    case (INDEPENDENT): {
        if (_unitName in wavePlayernamesInd) then {
            wavePlayernamesInd deleteAt (([wavePlayernamesInd,_unitName] call BIS_fnc_arrayFindDeep) select 0);
            INFO_1("Player %1 respawned and has been removed from wavePlayernamesInd.", _unitName);
        } else {
            ERROR_1("Player %1 is not in wavePlayernamesInd", _unitName);
        };
    };

    default {ERROR_1("Player %1 is neither WEST nor EAST nor INDEPENDENT.", _unitName)};
};

[{
    WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count wavePlayernamesBlu);
    WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count wavePlayernamesOpf);
    WAVERESPAWNPLAYERSLEFTIND = INDEPWAVESIZE - (count wavePlayernamesInd);
    publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
    publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
    publicVariable "WAVERESPAWNPLAYERSLEFTIND";
}, [], (RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitAndExecute;
