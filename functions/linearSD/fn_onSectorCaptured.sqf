#include "component.hpp"

params [["_sector",objNull],["_newOwner",sideUnknown],["_oldOwner",sideUnknown]];

if (!isServer) exitWith {};

private _endMessage = format ["%1 captured!",_sector getVariable [QEGVAR(sectors,sectorName),"ERROR: Sector unknown."]];

private _isLastSector = [_sectorID,_newOwner] call FUNC(isLastSector);
[_endMessage,_newOwner,_isLastSector] call FUNC(endRound);
