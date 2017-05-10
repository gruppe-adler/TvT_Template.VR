#include "component.hpp"

params ["_unit"];

private _unitFaction = switch (side _unit) do {
    case (WEST): {grad_missionsettings_loadoutFactionBlu};
    case (EAST): {grad_missionsettings_loadoutFactionOpf};
    case (INDEPENDENT): {grad_missionsettings_loadoutFactionInd};
    default {""};
};
private _unitLoadoutClass = missionConfigFile >> "Loadouts" >> "Faction" >> _unitFaction;


private _allowedRadios = [];
_allowedRadios pushBack ([_unitLoadoutClass >> "AllUnits" >> "radio","text",""] call CBA_fnc_getConfigEntry);
_allowedRadios pushBack ([_unitLoadoutClass >> "AllUnits" >> "backpack","text",""] call CBA_fnc_getConfigEntry);

private _loadouts = "true" configClasses (missionConfigFile >> "Loadouts" >> "Faction" >> _unitFaction >> "Type");
{
    _radio = [_x >> "radio","text",""] call CBA_fnc_getConfigEntry;
    _backpack = [_x >> "backpack","text",""] call CBA_fnc_getConfigEntry;
    if (_radio != "") then {_allowedRadios pushBack _radio};
    if (_backpack != "") then {_allowedRadios pushBack _backpack};
} forEach _loadouts;


_allowedRadios
