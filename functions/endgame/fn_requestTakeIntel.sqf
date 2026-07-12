#include "component.hpp"

params [["_intel",objNull],["_caller",objNull]];

if (!isNull (missionNamespace getVariable [QGVAR(intelCarrier),objNull])) exitWith {ERROR_1("Player %1 wanted to take intel, but intelCarrier is not null.",_caller)};
if (isNull _intel) exitWith {ERROR_1("Player %1 wanted to take intel, but intel is null?",_caller)};

missionNamespace setVariable [QGVAR(intelCarrier),_caller,true];
[_caller] call FUNC(onIntelTaken);
