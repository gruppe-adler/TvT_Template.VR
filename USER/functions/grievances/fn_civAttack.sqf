#include "component.hpp"

ISNILS(GVAR(attackingCivs), []);
// if (random 1 > 0.2) exitWith {};
GVAR(attackingCivs) = GVAR(attackingCivs) select { alive _x};
if (count GVAR(attackingCivs) > 50) exitWith { WARNING("a lot of civs are attacking. not spawning any more.")};
// attack some FOB
private _sideToAttack = selectRandom ([east, west] select { civilian getFriend _x < 0.6 });
if (isNil "_sideToAttack") exitWith {};
INFO_1("side to attack %1", _sideToAttack);
private _fob = switch (_sideToAttack) do {
	case (east): { pen_opf };
	case (west): { pen_blu };
	default { objNull };
};
private _group = createGroup [civilian, true];
private _count = round linearConversion [0.6, 0.0, civilian getFriend _sideToAttack, 1, 16, false];
private _house = [
	allPlayers,
	500,
	1000,
	"house"
] call grad_civs_legacy_fnc_findSpawnPosition;
if (isNull _house) exitWith {INFO("cant find house for attacking civs, sad");};

for "_i" from 1 to _count do {
	[_group, getPos _house] call FUNC(civAttack_createCiv);
};
GVAR(attackingCivs) = GVAR(attackingCivs) + (units _group);

private _icon = _group addGroupIcon ["o_inf", [0, 0]];
//_group setGroupIcon [_icon, "hc_selectedEnemy"];
_group setGroupIconParams [[0.8, 0, 0.8, 1],"attacking civs", 1, true, true, [0, 0, 0, 1]];

INFO_3("%1 is at %2 and will attack %3", _group, getPos leader _group, _fob);
[_group, _fob] call FUNC(attackLocation);
