#include "component.hpp"

if (([missionConfigFile >> "missionsettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 0) exitWith {};

GVAR(WAVERESPAWNTIMEPLAYER) = [missionConfigFile >> "missionsettings","waverespawntimePlayer",30] call BIS_fnc_returnConfigEntry;
GVAR(WAVERESPAWNTIMEBLU) = [missionConfigFile >> "missionsettings","waverespawntimeBlu",30] call BIS_fnc_returnConfigEntry;
GVAR(WAVERESPAWNTIMEOPF) = [missionConfigFile >> "missionsettings","waverespawntimeOpf",30] call BIS_fnc_returnConfigEntry;
GVAR(WAVERESPAWNTIMEIND) = [missionConfigFile >> "missionsettings","waverespawntimeInd",30] call BIS_fnc_returnConfigEntry;
GVAR(WAVERESPAWNTIMECIV) = [missionConfigFile >> "missionsettings","waverespawntimeCiv",30] call BIS_fnc_returnConfigEntry;

GVAR(WAVERESPAWNBLU) = false;
GVAR(WAVERESPAWNOPF) = false;
GVAR(WAVERESPAWNIND) = false;
GVAR(WAVERESPAWNCIV) = false;
GVAR(WAVERESPAWNTIMELEFTBLU) = GVAR(WAVERESPAWNTIMEBLU);
GVAR(WAVERESPAWNTIMELEFTOPF) = GVAR(WAVERESPAWNTIMEOPF);
GVAR(WAVERESPAWNTIMELEFTIND) = GVAR(WAVERESPAWNTIMEIND);
GVAR(WAVERESPAWNTIMELEFTCIV) = GVAR(WAVERESPAWNTIMECIV);
GVAR(MAXRESPAWNTIME) = 240;
GVAR(RESPAWNWAVEEXTRATIME) = 30;
GVAR(WAVERESPAWNSTATUSBLU) = "";
GVAR(WAVERESPAWNSTATUSOPF) = "";
GVAR(WAVERESPAWNSTATUSIND) = "";
GVAR(WAVERESPAWNSTATUSCIV) = "";

publicVariable QGVAR(WAVERESPAWNTIMEPLAYER);
publicVariable QGVAR(WAVERESPAWNTIMEBLU);
publicVariable QGVAR(WAVERESPAWNTIMEOPF);
publicVariable QGVAR(WAVERESPAWNTIMEIND);
publicVariable QGVAR(WAVERESPAWNTIMECIV);

publicVariable QGVAR(WAVERESPAWNBLU);
publicVariable QGVAR(WAVERESPAWNOPF);
publicVariable QGVAR(WAVERESPAWNIND);
publicVariable QGVAR(WAVERESPAWNCIV);
publicVariable QGVAR(WAVERESPAWNTIMELEFTBLU);
publicVariable QGVAR(WAVERESPAWNTIMELEFTOPF);
publicVariable QGVAR(WAVERESPAWNTIMELEFTIND);
publicVariable QGVAR(WAVERESPAWNTIMELEFTCIV);
publicVariable QGVAR(MAXRESPAWNTIME);
publicVariable QGVAR(RESPAWNWAVEEXTRATIME);
publicVariable QGVAR(WAVERESPAWNSTATUSBLU);
publicVariable QGVAR(WAVERESPAWNSTATUSOPF);
publicVariable QGVAR(WAVERESPAWNSTATUSIND);
publicVariable QGVAR(WAVERESPAWNSTATUSCIV);
