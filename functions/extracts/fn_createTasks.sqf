#include "component.hpp"

params ["_trigger"];

private _extractSides = _trigger getVariable "grad_extracts_extractSides";
private _sectorName = _trigger getVariable "grad_extracts_sectorName";
if (_sectorName == "") then {_sectorName = "the extract"};

private _extractDescription = [format ["Extract at %1.",_sectorName],"Extract",""];
private _preventDescription = [format ["Prevent enemy extraction at %1", _sectorName], "Prevent", ""];

{
    _extractSide = _x;
    _description = _extractDescription;
    _marker = "exit";
    _task = [
        _extractSide,
        format ["grad_extracts_task_%1_%2",_extractSide, getPos _trigger],
        _description,
        getPos _trigger,
        true,
        1,
        false,
        _marker,
        true
    ] call BIS_fnc_taskCreate;

    _trigger setVariable [format ["grad_extracts_task_%1", _extractSide],_task];


    _antagonists = ([east, west, independent] - _extractSides) select { _x getFriend _extractSide < 0.6 };

    {
      _antagonist = _x;
      _description = _preventDescription;
      _marker = "danger";
      _task = [
          _antagonist,
          format ["grad_extracts_task_%1_%2", _antagonist, getPos _trigger],
          _description,
          getPos _trigger,
          true,
          10,
          false,
          _marker,
          true
      ] call BIS_fnc_taskCreate;
    } count _antagonists;



    false
} count _extractSides;
