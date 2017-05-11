#include "component.hpp"

params ["_configName"];

if (missionNamespace getVariable ["grad_endings_endingInProgress",false]) exitWith {};
missionNamespace setVariable ["grad_endings_endingInProgress",true];
INFO_1("Ending %1 in progress.",_configName);

[_configName] remoteExec ["grad_endings_fnc_endMissionClient",0,false];
