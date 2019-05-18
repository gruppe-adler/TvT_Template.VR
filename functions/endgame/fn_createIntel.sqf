#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull],["_searchTime",0],["_taskText","Search for intel."]];

if (!(_logic isKindOf "LocationArea_F") && {!(_logic isKindOf "Logic")}) exitWith {ERROR_1("%1 is not an area or game logic.",_logic)};

private _trigger = (_logic call bis_fnc_moduleTriggers) param [0,objNull];
private _intel = ((synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")}) param [0,objNull];

INFO_2("Creating intel (type: %1, position %2).",_intel,getPos _intel);

_intel setVariable [QGVAR(searchTime),_searchTime,true];

[_intel] remoteExec [QFUNC(addIntelInteraction),0,false];
