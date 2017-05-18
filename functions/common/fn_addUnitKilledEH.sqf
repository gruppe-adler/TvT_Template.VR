#include "component.hpp"

params ["_handle","_code"];

if (!isServer) exitWith {_this remoteExec ["grad_common_fnc_addPlayerKilledEH",2,false]};

if (isNil "grad_common_onUnitKilledHandlers") then {
    grad_common_onUnitKilledHandlers = [[],[]];
};

grad_common_onUnitKilledHandlers params ["_handles","_codes"];

_handles pushBack _handle;
_codes pushBack _code;
