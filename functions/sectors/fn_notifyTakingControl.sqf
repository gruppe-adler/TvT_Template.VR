#include "component.hpp"

params ["_trigger","_currentOwner","_previousCapturingSide","_capturingSide"];

if (_capturingSide != _previousCapturingSide) then {

    if (_capturingSide == _currentOwner) then {
        private _sectorName = _trigger getVariable "grad_sectors_sectorName";
        if (_sectorName == "") then {_sectorName = "a sector"};

        ["grad_notification1",["SECTOR CAPTURING",format ["%1 regained control of %2.",[_currentOwner] call EFUNC(common,getSideDisplayName),_sectorName]]] remoteExec ["bis_fnc_showNotification",0,false];
        deleteMarker (_trigger getVariable [QGVAR(captureMarker),""]);

    } else {
        private _sectorName = _trigger getVariable "grad_sectors_sectorName";
        if (_sectorName == "") then {_sectorName = "a sector"};

        private _capturingSideName = [_capturingSide] call EFUNC(common,getSideDisplayName);
        ["grad_notification1",["SECTOR CAPTURING",format ["%1 is taking control of %2.",_capturingSideName,_sectorName]]] remoteExec ["bis_fnc_showNotification",0,false];

        // create map marker displaying current sector status
        deleteMarker (_trigger getVariable [QGVAR(captureMarker),""]);

        private _markerText = format ["%1 CAPTURING!",_capturingSideName];
        private _markerName = [format ["%1_captureMarker",_sectorName]] call BIS_fnc_filterString;
        private _mrk = createMarker [_markerName,(getPos _trigger) vectorAdd [50,-50,0]];

        _mrk setMarkerType "hd_warning";
        _mrk setMarkerColor ([_capturingSide,"MARKER"] call EFUNC(common,getSideColor));
        _mrk setMarkerText _markerText;

        _trigger setVariable [QGVAR(captureMarker),_mrk,false];
    };
};
