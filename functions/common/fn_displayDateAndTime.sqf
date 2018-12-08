#include "component.hpp"


if (!hasInterface) exitWith {};

date params ["_year","_month","_day","_hour","_minute"];

_hour = str _hour;
_minute = str _minute;
if (count _hour == 1) then {_hour = "0" + _hour};
if (count _minute == 1) then {_minute = "0" + _minute};

[
    format ["%1-%2-%3 %4:%5",_day,_month,_year,_hour,_minute],
    mapGridPosition player
] spawn BIS_fnc_infoText;
