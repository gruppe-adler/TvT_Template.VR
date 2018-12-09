#include "component.hpp"

params [["_activeSectorID",-1]];

private _inactiveSectorTriggers = +(GVAR(sectorTriggers));
private _activeSectorTriggers = _inactiveSectorTriggers deleteAt _activeSectorID;

{
    {
        [_x,true,false] call EFUNC(sectors,blockSector);
    } forEach _x;
} forEach _inactiveSectorTriggers;

{
    [_x,false,false] call EFUNC(sectors,blockSector);
} forEach _activeSectorTriggers;


missionNamespace setVariable [QGVAR(activeSectorID),_activeSectorID,true];
missionNamespace setVariable [QGVAR(activeSectors),GVAR(sectorTriggers) select GVAR(activeSectorID),true];
missionNamespace setVariable [QGVAR(defendingSide),(GVAR(activeSectors) select 0) getVariable [QEGVAR(sectors,currentOwner),sideUnknown]];
missionNamespace setVariable [QGVAR(attackDirection),[-(GVAR(opforDirection)),GVAR(opforDirection)] select (GVAR(defendingSide) == WEST),true];
missionNamespace setVariable [QGVAR(attackerSectorID),GVAR(activeSectorID) - GVAR(attackDirection),true];
missionNamespace setVariable [QGVAR(attackerSectors),GVAR(sectorTriggers) select GVAR(attackerSectorID),true];
missionNamespace setVariable [QGVAR(sectorsWest),[GVAR(attackerSectors),GVAR(activeSectors)] select (GVAR(defendingSide) == WEST),true];
missionNamespace setVariable [QGVAR(sectorsEast),[GVAR(attackerSectors),GVAR(activeSectors)] select (GVAR(defendingSide) == EAST),true];
missionNamespace setVariable [QGVAR(attackingSide),[WEST,EAST] select (GVAR(defendingSide) == WEST),true];
