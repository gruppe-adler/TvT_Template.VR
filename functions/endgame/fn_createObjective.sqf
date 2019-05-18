#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull],["_searchTime",0],["_singleUse",true],["_taskText","Search for intel."]];

if (!(_logic isKindOf "LocationArea_F") && {!(_logic isKindOf "Logic")}) exitWith {ERROR_1("%1 is not an area or game logic.",_logic)};

private _trigger = (_logic call bis_fnc_moduleTriggers) param [0,objNull];
private _objective = ((synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")}) param [0,objNull];

INFO_2("Creating intel (type: %1, position %2).",_objective,getPos _objective);

_objective setVariable [QGVAR(searchTime),_searchTime,true];
_objective setVariable [QGVAR(singleUse),_singleUse,true];

[_objective] remoteExec [QFUNC(addObjectiveInteraction),0,false];
