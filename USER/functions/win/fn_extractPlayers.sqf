#include "component.hpp"

params [
    ["_extractToSide", sideUnknown, [sideUnknown]],
    ["_playersOrVehicles", [], [[]]]
];

private _players = _playersOrVehicles select { _x isKindOf "Man"};
private _vehicles = _playersOrVehicles select { _x isKindOf "Car"};

INFO_3("extracting vehicles %1 and players %2 to side ", _vehicles, _players, _extractToSide);

assert(isServer);

ISNILS(GVAR(extractedPlayers), []);
_players = _players - GVAR(extractedPlayers);

INFO_1("already extracted are: %1", GVAR(extractedPlayers));

GVAR(extractedPlayers) = GVAR(extractedPlayers) + _players;

if (isNil "CBA_fnc_hashValues") then {
    CBA_fnc_hashValues = { +((_this#0) select 2); };
};

{
    private _vehicle = _x;
    private _vehPlayers = (crew _vehicle) select {isPlayer _x};
    GVAR(extractedPlayers) = GVAR(extractedPlayers) + _vehPlayers;
    {
        [QGVAR(player_extracted), [_extractToSide, _x], _x] call CBA_fnc_targetEvent;
    } forEach _vehPlayers;

    private _npcs = (crew _vehicle) select {!(isPlayer _x)};
    { deleteVehicle _x; } forEach _npcs;

    private _animals = [_vehicle getVariable ["grad_animalTransport_common_animals", [] call CBA_fnc_hashCreate]] call CBA_fnc_hashValues;
    private _num = count _animals;

    INFO_2("adding %1 points for sheep on %2", _num, _vehicle);
    [_extractToSide, _num, "extracted sheep"] call grad_points_fnc_addPoints;

    { deleteVehicle _x; } forEach _animals;
    deleteVehicle _vehicle;
} forEach _vehicles;

{
    private _sheep = (_x nearEntities ["Sheep_Random_F", 25]);
    INFO_2("adding %1 points for sheep at %2", count _sheep, _x);
    if (count _sheep > 0) then {
        [_extractToSide, count _sheep, "extracted sheep (walking)"] call grad_points_fnc_addPoints;
    };
    { deleteVehicle _x; } forEach _sheep;

    [QGVAR(player_extracted), [_extractToSide, _x], _x] call CBA_fnc_targetEvent;
} forEach _players;
