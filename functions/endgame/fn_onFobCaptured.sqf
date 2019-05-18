#include "component.hpp"

params ["_trigger"];

systemChat "FOB captured";
systemChat str (_trigger getVariable QGVAR(fobSide));

private _gamephaseVar = [QGVAR(gamePhaseEast),QGVAR(gamePhaseWest)] select ((_trigger getVariable [QGVAR(fobSide),sideUnknown]) == WEST);
missionNamespace setVariable [_gamephaseVar,1,true];
