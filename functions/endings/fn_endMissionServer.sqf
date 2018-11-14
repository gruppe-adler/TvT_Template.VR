#include "component.hpp"

// do not add default values here - some params are nil by design and will be read from config in fnc_endMissionClient
params ["_configName","_winText","_winners","_winTextParams"];

if (missionNamespace getVariable ["grad_endings_endingInProgress",false]) exitWith {};
missionNamespace setVariable ["grad_endings_endingInProgress",true];
INFO_1("Ending %1 in progress.",_configName);

[_configName,_winText,_winners,_winTextParams] remoteExec ["grad_endings_fnc_endMissionClient",0,false];
