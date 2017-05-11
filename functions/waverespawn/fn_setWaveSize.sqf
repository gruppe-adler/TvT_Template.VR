/*    Sets wave respawn wave size
*
*/

#include "component.hpp"

BLUFORWAVESIZE = [missionConfigFile >> "missionsettings","bluforWaveSize",1] call BIS_fnc_returnConfigEntry;
OPFORWAVESIZE = [missionConfigFile >> "missionsettings","opforWaveSize",1] call BIS_fnc_returnConfigEntry;
INDEPWAVESIZE = [missionConfigFile >> "missionsettings","indepWaveSize",1] call BIS_fnc_returnConfigEntry;

_allPlayers = [] call BIS_fnc_listPlayers;
if (BLUFORWAVESIZE < 0) then {
    _teamSize = west countside _allPlayers;
    BLUFORWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;
};
if (INDEPWAVESIZE < 0) then {
    _teamSize = independent countside _allPlayers;
    INDEPWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;
};
if (OPFORWAVESIZE < 0) then {
    _teamSize = east countside _allPlayers;
    OPFORWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;
};

WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE;
WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE;
WAVERESPAWNPLAYERSLEFTIND = INDEPWAVESIZE;

publicVariable "BLUFORWAVESIZE";
publicVariable "OPFORWAVESIZE";
publicVariable "INDEPWAVESIZE";
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
publicVariable "WAVERESPAWNPLAYERSLEFTIND";

INFO_1("Blufor wave size is %1", BLUFORWAVESIZE);
INFO_1("Independent wave size is %1", INDEPWAVESIZE);
INFO_1("Opfor wave size is %1", OPFORWAVESIZE);
