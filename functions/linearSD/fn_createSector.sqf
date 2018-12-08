#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull],["_sectorName","UNKNOWN SECTOR"],["_owner",sideUnknown],["_id",-1],["_notifyTakingControl",true],["_captureTime",480]];

if !(_logic isKindOf "LocationArea_F") exitWith {ERROR_1("%1 is not an area logic.",_logic)};
[_logic,_sectorName,0,0,false,[WEST,EAST,INDEPENDENT],_owner,_notifyTakingControl,FUNC(onSectorCaptured),_id,[1,_captureTime]] call EFUNC(sectors,createSector);

if (isNil QGVAR(sectorTriggers)) then {GVAR(sectorTriggers) = []};

private _idTriggerArray = GVAR(sectorTriggers) param [_id,[]];
_idTriggerArray append (_logic call bis_fnc_moduleTriggers);
GVAR(sectorTriggers) set [_id,_idTriggerArray];
