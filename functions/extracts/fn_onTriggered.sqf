#include "component.hpp"

params ["_trigger", "_players"];

private _sectorName = _trigger getVariable "grad_extracts_sectorName";
private _extractSides = _trigger getVariable "grad_extracts_extractSides";
private _getPointsForExtract = _trigger getVariable "grad_extracts_pointsForExtract";

{
  _player = _x;
  private _playerSide = side _player;

  INFO_2("onTriggered extract %1 for %2", _sectorName, _player);

  if (_playerSide in _extractSides) then {
      _pointsForExtract = [_playerSide] call _getPointsForExtract;
      [_playerSide, _pointsForExtract, _sectorName] call grad_points_fnc_addPoints;
      [_player, true] call TFAR_fnc_forceSpectator;
      [true] call ace_spectator_fnc_setSpectator;
  };

} forEach _players;
