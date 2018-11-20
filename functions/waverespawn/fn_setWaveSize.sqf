/*    Sets wave respawn wave size
*
*/

#include "component.hpp"

GVAR(BLUFORWAVESIZE) = [missionConfigFile >> "missionsettings","bluforWaveSize",1] call BIS_fnc_returnConfigEntry;
GVAR(OPFORWAVESIZE) = [missionConfigFile >> "missionsettings","opforWaveSize",1] call BIS_fnc_returnConfigEntry;
GVAR(INDEPWAVESIZE) = [missionConfigFile >> "missionsettings","indepWaveSize",1] call BIS_fnc_returnConfigEntry;

_allPlayers = [] call BIS_fnc_listPlayers;
if (GVAR(BLUFORWAVESIZE) < 0) then {
    _teamSize = west countside _allPlayers;
    GVAR(BLUFORWAVESIZE) = (ceil ((_teamSize / 3) - 0.5)) max 1;
};
if (GVAR(INDEPWAVESIZE) < 0) then {
    _teamSize = independent countside _allPlayers;
    GVAR(INDEPWAVESIZE) = (ceil ((_teamSize / 3) - 0.5)) max 1;
};
if (GVAR(OPFORWAVESIZE) < 0) then {
    _teamSize = east countside _allPlayers;
    GVAR(OPFORWAVESIZE) = (ceil ((_teamSize / 3) - 0.5)) max 1;
};

GVAR(WAVERESPAWNPLAYERSLEFTBLU) = GVAR(BLUFORWAVESIZE);
GVAR(WAVERESPAWNPLAYERSLEFTOPF) = GVAR(OPFORWAVESIZE);
GVAR(WAVERESPAWNPLAYERSLEFTIND) = GVAR(INDEPWAVESIZE);

publicVariable QGVAR(BLUFORWAVESIZE);
publicVariable QGVAR(OPFORWAVESIZE);
publicVariable QGVAR(INDEPWAVESIZE);
publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTBLU);
publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTOPF);
publicVariable QGVAR(WAVERESPAWNPLAYERSLEFTIND);

INFO_1("Blufor wave size is %1", GVAR(BLUFORWAVESIZE));
INFO_1("Independent wave size is %1", GVAR(INDEPWAVESIZE));
INFO_1("Opfor wave size is %1", GVAR(OPFORWAVESIZE));
