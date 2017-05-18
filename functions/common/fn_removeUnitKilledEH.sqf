#include "component.hpp"

params ["_handle"];

if (!isServer) exitWith {_this remoteExec ["grad_common_fnc_addPlayerKilledEH",2,false]};

grad_common_onUnitKilledHandlers params ["_handles","_codes"];

private _handleID = _handles find _handle;
if (_handleID < 0) exitWith {ERROR_1("Player killed EH handle %1 not found.",_handle)};

_handles deleteAt _handleID;
_codes deleteAt _handleID;
