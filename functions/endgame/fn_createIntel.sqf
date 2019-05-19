#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull]];

if (!(_logic isKindOf "LocationArea_F") && {!(_logic isKindOf "Logic")}) exitWith {ERROR_1("%1 is not an area or game logic.",_logic)};

if !(isNil QGVAR(intel)) exitWith {ERROR("Intel already exists.")};

GVAR(intel) = selectRandom ((synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")});
if (isNil QGVAR(intel)) exitWith {ERROR("No intel object synchronized with game logic.")};

GVAR(intel) setVariable [QGVAR(objectiveID),0];

[GVAR(intel)] remoteExec [QFUNC(addIntelInteractions),0,true];

GVAR(intel) allowDamage false;
