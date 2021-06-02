#include "component.hpp"

params [
    ["_extractToSide", sideUnknown, [sideUnknown]],
    ["_triggerUnits", [], [[]]]
];

assert(isServer);

private _triggerMen = (_triggerUnits select { _x isKindOf "Man"});
private _cars = _triggerUnits select { _x isKindOf "Car"};

private _men = _triggerMen + flatten (_cars apply {crew _x});
private _players = _men arrayIntersect playableUnits;
private _npcs = _men - _players;
private _rest = _triggerUnits - _men - _cars;

ISNILS(GVAR(extractedPlayers), []);
INFO_1("already extracted were: %1", GVAR(extractedPlayers));
INFO_4("now extracting cars %1 and units %2 to side %3, ignoring %4...", _cars, _men, _extractToSide, _rest);
GVAR(extractedPlayers) = GVAR(extractedPlayers) + _players;

{
    private _vehicle = _x;

    private _animals = [_vehicle getVariable ["grad_animalTransport_common_animals", [] call CBA_fnc_hashCreate]] call CBA_fnc_hashValues;
    private _num = count _animals;

    INFO_2("adding %1 points for sheep on %2", _num, _vehicle);
    [_extractToSide, _num, "extracted sheep"] call grad_points_fnc_addPoints;

    { deleteVehicle _x; } forEach _animals;
    deleteVehicle _vehicle;
} forEach _cars;

{
    private _sheep = (_x nearEntities ["Sheep_Random_F", 25]);
    INFO_2("adding %1 points for sheep at %2", count _sheep, _x);
    if (count _sheep > 0) then {
        [_extractToSide, count _sheep, "extracted sheep (walking)"] call grad_points_fnc_addPoints;
    };
    { deleteVehicle _x; } forEach _sheep;

    _x setPos [-1000, -1000];
    [QGVAR(player_extracted), [_extractToSide, _x], _x] call CBA_fnc_targetEvent;
} forEach _players;

{
    deleteVehicle _x;
} forEach _npcs;

/*
{
    WARNING_1("hmm deleting something thats neither car nor man: %1", _x);
    deleteVehicle _x;
} forEach _rest;
*/