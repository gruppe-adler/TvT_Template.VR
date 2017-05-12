#include "component.hpp"

grad_missionsettings_canTakeEnemyRadios = ([configFile >> "missionsettings","canTakeEnemyRadios",0] call BIS_fnc_returnConfigEntry) == 1;
grad_missionsettings_canUseScopes = ([configFile >> "missionsettings","canUseScopes",0] call BIS_fnc_returnConfigEntry) == 1;

[] call grad_missionSetup_fnc_loadouts;
[] call grad_missionSetup_fnc_createDiaryRecords;
[] call grad_missionSetup_fnc_intro;

if (isServer) then {
    [{[] call grad_endings_fnc_init}, [], 10] call CBA_fnc_waitAndExecute;
};
