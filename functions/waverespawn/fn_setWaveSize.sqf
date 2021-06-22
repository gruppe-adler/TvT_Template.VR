/*    Sets wave respawn wave size
*
*/

#include "component.hpp"

GVAR(BLUFORWAVESIZE) = [missionConfigFile >> "missionsettings","bluforWaveSize",1] call BIS_fnc_returnConfigEntry;
GVAR(OPFORWAVESIZE) = [missionConfigFile >> "missionsettings","opforWaveSize",1] call BIS_fnc_returnConfigEntry;
GVAR(INDEPWAVESIZE) = [missionConfigFile >> "missionsettings","indepWaveSize",1] call BIS_fnc_returnConfigEntry;
GVAR(CIVWAVESIZE) = [missionConfigFile >> "missionsettings","civWaveSize",1] call BIS_fnc_returnConfigEntry;

private _allPlayers = [] call BIS_fnc_listPlayers;
if (GVAR(BLUFORWAVESIZE) < 0) then {
    _teamSize = count ({_x getVariable ["FF_originalSide", sideUnknown] == WEST} count _allPlayers);
    GVAR(BLUFORWAVESIZE) = (ceil ((_teamSize / 3) - 0.5)) max 1;
};
if (GVAR(OPFORWAVESIZE) < 0) then {
    _teamSize = count ({_x getVariable ["FF_originalSide", sideUnknown] == EAST} count _allPlayers);
    GVAR(OPFORWAVESIZE) = (ceil ((_teamSize / 3) - 0.5)) max 1;
};
if (GVAR(INDEPWAVESIZE) < 0) then {
    _teamSize = count ({_x getVariable ["FF_originalSide", sideUnknown] == INDEPENDENT} count _allPlayers);
    GVAR(INDEPWAVESIZE) = (ceil ((_teamSize / 3) - 0.5)) max 1;
};
if (GVAR(CIVWAVESIZE) < 0) then {
    _teamSize = count ({_x getVariable ["FF_originalSide", sideUnknown] == CIVILIAN} count _allPlayers);
    GVAR(CIVWAVESIZE) = (ceil ((_teamSize / 3) - 0.5)) max 1;
};

GVAR(WAVERESPAWNPLAYERSLEFTBLU) = GVAR(BLUFORWAVESIZE);
GVAR(WAVERESPAWNPLAYERSLEFTOPF) = GVAR(OPFORWAVESIZE);
GVAR(WAVERESPAWNPLAYERSLEFTIND) = GVAR(INDEPWAVESIZE);
GVAR(WAVERESPAWNPLAYERSLEFTCIV) = GVAR(CIVWAVESIZE);

publicVariable QGVAR(BLUFORWAVESIZE);
publicVariable QGVAR(OPFORWAVESIZE);
publicVariable QGVAR(INDEPWAVESIZE);
publicVariable QGVAR(CIVWAVESIZE);
publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTBLU);
publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTOPF);
publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTIND);
publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTCIV);

INFO_1("Blufor wave size is %1", GVAR(BLUFORWAVESIZE));
INFO_1("Opfor wave size is %1", GVAR(OPFORWAVESIZE));
INFO_1("Independent wave size is %1", GVAR(INDEPWAVESIZE));
INFO_1("Civilian wave size is %1", GVAR(CIVWAVESIZE));
