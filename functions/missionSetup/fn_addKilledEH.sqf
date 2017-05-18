#include "component.hpp"

if (!hasInterface) exitWith {};

player addEventHandler ["Killed",{
    _dmgSource = player getVariable ["ACE_medical_lastDamageSource",player];
    [player,playerSide,profileName,getplayerUID player,_dmgSource,side _dmgSource,getplayerUID _dmgSource,CBA_missionTime] remoteExec ["grad_common_fnc_onPlayerKilled",2,false];
}]
