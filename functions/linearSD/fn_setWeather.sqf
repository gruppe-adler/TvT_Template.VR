#include "component.hpp"

if (!isServer) exitWith {};

private _targetWeather = GVAR(weatherArray) deleteAt 0;
if (isNil "_targetWeather") exitWith {};

[_targetWeather] spawn {
    (_this select 0) params [["_overcast",random 0.4],["_fogParams",[0,0,0]]];

    [_overcast] call BIS_fnc_setOvercast;

    sleep 1;
    0.5 setFog _fogParams;
};
