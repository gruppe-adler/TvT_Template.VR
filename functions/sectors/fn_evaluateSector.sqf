#include "component.hpp"

params ["_trigger"];

private _currentOwner = _trigger getVariable QGVAR(currentOwner);

private _list = list _trigger;

(_trigger getVariable [QGVAR(captureMode),0]) params ["_captureMode","_captureModeParams"];

private _captureSides = _trigger getVariable [QGVAR(captureSides),[]];
private _sideStrengths = _trigger getVariable QGVAR(sideStrengths);

private _return = [_currentOwner,_currentOwner];

// strength capture mode
if (_captureMode == 0) then {

    // no units in sector trigger --> no change in ownership
    _countTotal = count _list;
    if (_countTotal > 0) then {_countTotal = _countTotal - (sideLogic countSide _list) - (CIVILIAN countSide _list)};
    if (_countTotal == 0) exitWith {};

    _maxStrengthAdd = 0;
    _capturingSideID = -1;
    {
        _currentStrength = _sideStrengths select _forEachIndex;
        _countSide = _x countSide _list;

        _strengthAdd = (_countSide/_countTotal - 0.5)/15;
        if (_strengthAdd > _maxStrengthAdd) then {
            _maxStrengthAdd = _strengthAdd;
            _capturingSideID = _forEachIndex;
        };

        _sideStrengths set [_forEachIndex,(_currentStrength + _strengthAdd) max 0 min 1];
    } forEach _captureSides;

    _ownerID = _sideStrengths findIf {_x == 1};
    _owner = if (_newOwnerID < 0) then {_currentOwner} else {_captureSides select _ownerID};

    _capturingSide = if (_capturingSideID >= 0) then {_captureSides select _capturingSideID} else {_currentOwner};

    _return = [_owner,_capturingSide];
};

// time capture mode
if (_captureMode == 1) then {

    // no units in sector trigger --> no change in ownership, reset strengths
    _countTotal = count _list;
    if (_countTotal > 0) then {_countTotal = _countTotal - (sideLogic countSide _list) - (CIVILIAN countSide _list)};

    if (_countTotal == 0) exitWith {
        _sideStrengths resize 0;
        _sideStrengths append (_captureSides apply {0});
        _return = [_currentOwner,_currentOwner];
    };

    _captureTime = _captureModeParams;

    _maxCount = 0;
    _sideInControlID = -1;

    {
        _sideCount = _x countSide _list;
        if (_sideCount > _maxCount) then {
            _maxCount = _sideCount;
            _sideInControlID = _forEachIndex;
        };
    } forEach _captureSides;

    if (_sideInControlID >= 0) then {
        _sideInControl = _captureSides select _sideInControlID;

        // current owner is in control --> reset side strengths
        if (_sideInControl == _currentOwner) then {

            _sideStrengths resize 0;
            _sideStrengths append (_captureSides apply {0});

            _return = [_currentOwner,_currentOwner];


        // new side is taking control
        } else {

            _previousStrength = _sideStrengths select _sideInControlID;
            _newStrength = (_previousStrength + (1 / _captureTime)) min 1;
            _sideStrengths set [_sideInControlID,_newStrength];

            _owner = if (_newStrength == 1) then {_sideInControl} else {_currentOwner};

            _return = [_owner,_sideInControl];
        };
    } else {

        // no one in control --> reset side strengths
        _sideStrengths resize 0;
        _sideStrengths append (_captureSides apply {0});
    };
};

_return
