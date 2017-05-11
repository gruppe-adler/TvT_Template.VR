#include "component.hpp"

if (([missionConfigFile >> "missionsettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 0) exitWith {};

WAVERESPAWNTIMEPLAYER = [missionConfigFile >> "missionsettings","waverespawntimePlayer",30] call BIS_fnc_returnConfigEntry;
WAVERESPAWNTIMEBLU = [missionConfigFile >> "missionsettings","waverespawntimeBlu",30] call BIS_fnc_returnConfigEntry;
WAVERESPAWNTIMEOPF = [missionConfigFile >> "missionsettings","waverespawntimeOpf",30] call BIS_fnc_returnConfigEntry;
WAVERESPAWNTIMEIND = [missionConfigFile >> "missionsettings","waverespawntimeInd",30] call BIS_fnc_returnConfigEntry;

WAVERESPAWNBLU = false;
WAVERESPAWNOPF = false;
WAVERESPAWNIND = false;
WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIMEBLU;
WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIMEOPF;
WAVERESPAWNTIMELEFTIND = WAVERESPAWNTIMEIND;
MAXRESPAWNTIME = 1200;
RESPAWNWAVEEXTRATIME = 30;
WAVERESPAWNSTATUSBLU = "";
WAVERESPAWNSTATUSOPF = "";
WAVERESPAWNSTATUSIND = "";

publicVariable "WAVERESPAWNTIMEPLAYER";
publicVariable "WAVERESPAWNTIMEBLU";
publicVariable "WAVERESPAWNTIMEOPF";
publicVariable "WAVERESPAWNTIMEIND";

publicVariable "WAVERESPAWNBLU";
publicVariable "WAVERESPAWNOPF";
publicVariable "WAVERESPAWNIND";
publicVariable "WAVERESPAWNTIMELEFTBLU";
publicVariable "WAVERESPAWNTIMELEFTOPF";
publicVariable "WAVERESPAWNTIMELEFTIND";
publicVariable "MAXRESPAWNTIME";
publicVariable "RESPAWNWAVEEXTRATIME";
publicVariable "WAVERESPAWNSTATUSBLU";
publicVariable "WAVERESPAWNSTATUSOPF";
publicVariable "WAVERESPAWNSTATUSIND";
