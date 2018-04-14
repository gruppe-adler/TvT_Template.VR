#include "component.hpp"

params ["_trigger", "_player"];

private _playerSide = side _player;
private _sectorName = _trigger getVariable "grad_sectors_sectorName";
private _extractSides = _trigger getVariable "grad_extracts_extractSides";
private _pointsForExtract = _trigger getVariable "grad_extracts_pointsForExtract";


INFO_2("onTriggered extract %1 for %2", _sectorName, _player);

[_trigger] call grad_sectors_fnc_updateMarker;


if (_playerSide in _extractSides) then {
    [_playerSide, _pointsForExtract, _sectorName] call grad_points_fnc_addPoints;
    [_player, true] call TFAR_fnc_forceSpectator;
    [true] call ace_spectator_fnc_setSpectator;
};