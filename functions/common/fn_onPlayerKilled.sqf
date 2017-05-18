#include "component.hpp"

params ["_victim","_victimSide","_victimName","_victimUID","_killer","_killerSide","_killerUID","_killTime"];

{
    _this call _x;
    false
} count (grad_common_onPlayerKilledHandlers select 1);
