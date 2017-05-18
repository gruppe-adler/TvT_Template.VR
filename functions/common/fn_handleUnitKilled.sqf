#include "component.hpp"

params ["_unit","_killer","_instigator","_useEffects"];

if (!local _unit) exitWith {};

private _dmgSource = _unit getVariable ["ACE_medical_lastDamageSource",_unit];
private _dmgSide = side (group _dmgSource);
private _unitSide = if (_unit == player) then {playerSide} else {side (group _unit)};
private _params = [_unit,_unitSide,player == _unit,_dmgSource,_dmgSide,isPlayer _killer,CBA_missionTime];

if (isServer) then {
    _params call grad_common_fnc_onUnitKilled;
} else {
    _params remoteExec ["grad_common_fnc_onUnitKilled",2,false];
};
