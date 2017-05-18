#include "component.hpp"

params ["_victim","_victimSide","_victimIsPlayer","_killer","_killerSide","_killerIsPlayer","_killTime"];

if (isNil "grad_common_onUnitKilledHandlers") exitWith {};

{
    _this call _x;
    false
} count (grad_common_onUnitKilledHandlers select 1);
