#include "component.hpp"

params ["_trigger","_currentOwner","_previousCapturingSide","_capturingSide"];

if (_capturingSide != _previousCapturingSide) then {

    if (_capturingSide == _currentOwner) then {
        _sectorName = _trigger getVariable "grad_sectors_sectorName";
        if (_sectorName == "") then {_sectorName = "a sector"};

        ["grad_notification1",["SECTOR CAPTURING",format ["%1 regained control of %2.",[_currentOwner] call EFUNC(common,getSideDisplayName),_sectorName]]] remoteExec ["bis_fnc_showNotification",0,false];
    } else {
        _sectorName = _trigger getVariable "grad_sectors_sectorName";
        if (_sectorName == "") then {_sectorName = "a sector"};

        _capturingSideName = [_capturingSide] call EFUNC(common,getSideDisplayName);
        ["grad_notification1",["SECTOR CAPTURING",format ["%1 is taking control of %2.",_capturingSideName,_sectorName]]] remoteExec ["bis_fnc_showNotification",0,false];
    };
};
