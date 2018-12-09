#include "component.hpp"

params ["_side","_newRadios"];

private _sideID = [WEST,EAST,INDEPENDENT,CIVILIAN] find _side;
if (_sideID < 0) exitWith {};

private _otherRadioArrayVarNames = [QGVAR(radiosWest),QGVAR(radiosEast),QGVAR(radiosIndependent),QGVAR(radiosCivilian)];
{if (isNil _x) then {missionNamespace setVariable [_x,[]]}} forEach _otherRadioArrayVarNames;

private _thisRadioArrayVarName = _otherRadioArrayVarNames deleteAt _sideID;
{
    _radio = _x;

    // add radio to new owner side
    (missionNamespace getVariable _thisRadioArrayVarName) pushBackUnique _radio;

    // delete radios from other sides
    {
        _thisArray = missionNamespace getVariable _x;
        _radioID = _thisArray find _radio;

        while {_radioID > 0} do {
            _thisArray deleteAt _radioID;
            _radioID = _thisArray find _radio;
        };
    } forEach _otherRadioArrayVarNames;
} forEach _newRadios;

// publish
{
    publicVariable _x;
} forEach (_otherRadioArrayVarNames + [_thisRadioArrayVarName]);
