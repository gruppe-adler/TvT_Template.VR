#include "component.hpp"

{
    _x params ["_respawnMarker","_sectors"];
    _sector = selectRandom _sectors;

    _respawnPos = _sector getVariable [QGVAR(respawnPosition),(getPos _sector) findEmptyPosition [0,50,"B_Soldier_F"]];
    if (count _respawnPos == 0) then {_respawnPos = getPos _sector};

    _respawnMarker setMarkerPos _respawnPos;
} forEach [
    ["respawn_west",GVAR(sectorsWest)],
    ["respawn_east",GVAR(sectorsEast)]
];
