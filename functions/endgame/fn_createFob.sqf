#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull],["_side",sideUnknown],["_sectorName","FOB"]];

if (!(_logic isKindOf "LocationArea_F") && {!(_logic isKindOf "Logic")}) exitWith {ERROR_1("%1 is not an area or game logic.",_logic)};
if !(_side in [WEST,EAST]) exitWith {ERROR_1("Side %1 is not allowed for FOB creation. (Has to be side that is supposed to capture the FOB.)")};

private _trigger = (_logic call bis_fnc_moduleTriggers) param [0,objNull];
_trigger setTriggerActivation ["ANY","PRESENT",true];
_trigger setVariable [QGVAR(fobSide),_side];
[_trigger] call FUNC(fobPFH);
