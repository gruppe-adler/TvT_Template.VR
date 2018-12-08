/*  Checks if winner of round has just captured the enemy HQ
 *
 */

#include "component.hpp"

params ["_sectorID","_winner"];

private _winnerDirection = GVAR(opforDirection) * ([-1,1] select (_winner == EAST));
private _loserLastSectorID = [0,(count GVAR(sectorTriggers)) - 1] select (_winnerDirection > 0);

_sectorID == _loserLastSectorID
