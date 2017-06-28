#include "component.hpp"

grad_missionsettings_canTakeEnemyRadios = ([configFile >> "missionsettings","canTakeEnemyRadios",0] call BIS_fnc_returnConfigEntry) == 1;
grad_missionsettings_canUseScopes = ([configFile >> "missionsettings","canUseScopes",0] call BIS_fnc_returnConfigEntry) == 1;

[] call grad_missionSetup_fnc_loadouts;
[] call grad_missionSetup_fnc_createDiaryRecords;
[] call grad_missionSetup_fnc_intro;
[] call grad_missionSetup_fnc_initCivs;
[] call grad_groupsettings_fnc_setGroupSettings;


[{!isNull player || isDedicated},{

    if (isServer) then {
        [["PREPARATION_TIME", 0] call BIS_fnc_getParamValue] call grad_missionSetup_fnc_startPreparationTime;
        [{CBA_missionTime > 10 && {missionNamespace getVariable ["GRAD_MISSIONSTARTED",false]}}, {[] call grad_endings_fnc_init}, []] call CBA_fnc_waitUntilAndExecute;
    };

    if (hasInterface) then {

    };
},[]] call CBA_fnc_waitUntilAndExecute;
