#include "component.hpp"

EGVAR(missionsettings,canTakeEnemyRadios) = ([missionConfigFile >> "missionsettings","canTakeEnemyRadios",0] call BIS_fnc_returnConfigEntry) == 1;
EGVAR(missionsettings,canUseScopes) = ([missionConfigFile >> "missionsettings","canUseScopes",0] call BIS_fnc_returnConfigEntry) == 1;

[] call grad_missionSetup_fnc_loadouts;
[] call grad_missionSetup_fnc_createDiaryRecords;
[] call grad_missionSetup_fnc_intro;
[] call grad_missionSetup_fnc_initCivs;
[] call grad_groupsettings_fnc_setGroupSettings;
[] call FUNC(addChatCommands);

["grad_loadout_loadoutApplied",EFUNC(common,onLoadoutApplied)] call CBA_fnc_addEventHandler;

if (!isServer) then {[] call GRAD_replay_fnc_init};

[{!isNull player || isDedicated},{

    if (isServer) then {
        missionNamespace setVariable [QEGVAR(common,gamePaused),false,true];

        [
            {missionNamespace getVariable ["CBA_missionTime",0] > 0},
            FUNC(startPreparationTime),
            [["PREPARATION_TIME", 0] call BIS_fnc_getParamValue,{missionNamespace setVariable ["GRAD_MISSIONSTARTED",true,true]}]
        ] call CBA_fnc_waitUntilAndExecute;

        [{(missionNamespace getVariable ["CBA_missionTime",0] > 10) && {missionNamespace getVariable ["GRAD_MISSIONSTARTED",false]}},{
            [] call grad_endings_fnc_init;
            [] call GRAD_replay_fnc_init;
        }, []] call CBA_fnc_waitUntilAndExecute;
    };

    if (hasInterface) then {
        [QGVAR(onRadiosReceivedEH),"OnRadiosReceived",{[playerSide,_newRadios] remoteExec [QEFUNC(common,receiveSwRadioSide),2,false]},player] call TFAR_fnc_addEventHandler;
    };

},[]] call CBA_fnc_waitUntilAndExecute;
