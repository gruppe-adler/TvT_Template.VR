#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull],["_side",sideUnknown]];

if (!(_logic isKindOf "LocationArea_F") && {!(_logic isKindOf "Logic")}) exitWith {ERROR_1("%1 is not an area or game logic.",_logic)};

private _sideUploadVar = [QGVAR(uploadEast),QGVAR(uploadWest)] select (_side == WEST);
if !(isNil _sideUploadVar) exitWith {ERROR_1("Upload for side %1 already exists.",_side)};

missionNamespace setVariable [_sideUploadVar,selectRandom ((synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector")}),true];
if (isNil _sideUploadVar) exitWith {ERROR("No upload object synchronized with game logic.")};

private _uploadObj = missionNamespace getVariable _sideUploadVar;

_uploadObj allowDamage false;
