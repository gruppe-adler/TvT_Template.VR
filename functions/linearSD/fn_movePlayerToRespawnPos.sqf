#include "component.hpp"

private _respawnMarker = ["respawn_west","respawn_east"] select (playerSide == EAST);
private _pos = (getMarkerPos _respawnMarker) findEmptyPosition [0,30,"B_Soldier_F"];
if (_pos isEqualTo []) then {_pos = getMarkerPos _respawnMarker};
[player,_pos] call EFUNC(common,teleport);
