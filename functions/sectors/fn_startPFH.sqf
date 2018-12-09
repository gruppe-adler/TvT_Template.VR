#include "component.hpp"

params ["_trigger"];
INFO_1("PFH for %1 starting.",_trigger getVariable "grad_sectors_sectorName");

[_trigger] call grad_sectors_fnc_updateMarker;

private _previousCapturingSide = _trigger getVariable QGVAR(currentOwner);

[{
    params ["_args","_handle"];
    _args params ["_trigger","_previousCapturingSide"];

    if (EGVAR(common,gamePaused)) exitWith {};

    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        ERROR("A sector trigger is null. Exiting PFH.");
    };

    _oldOwner = _trigger getVariable "grad_sectors_currentOwner";
    _pps = _trigger getVariable "grad_sectors_pointsPerSecond";
    if (_pps > 0 && {_oldOwner != sideUnknown}) then {
        _categoryName = format ["Held %1",_trigger getVariable "grad_sectors_sectorName"];
        [_oldOwner,_pps,_categoryName] call grad_points_fnc_addPoints;
    };

    // sector blocked by fn_blockSector
    if (_trigger getVariable [QGVAR(blocked),false]) exitWith {};

    ([_trigger] call FUNC(evaluateSector)) params ["_newOwner","_capturingSide"];

    // notification if new side is taking control
    if (_trigger getVariable QGVAR(notifyTakingControl)) then {
        [_trigger,_oldOwner,_previousCapturingSide,_capturingSide] call FUNC(notifyTakingControl);
    };

    _args set [1,_capturingSide];


    if (_newOwner != _oldOwner) then {
        _trigger setVariable ["grad_sectors_previousOwner",_oldOwner];
        _trigger setVariable ["grad_sectors_currentOwner",_newOwner];
        [_trigger] call grad_sectors_fnc_updateMarker;
        [_trigger] call grad_sectors_fnc_notification;

        _sectorName = _trigger getVariable "grad_sectors_sectorName";
        if (_sectorName == "") then {_sectorName = "A sector"};
        _ownerName = [_newOwner] call EFUNC(common,getSideDisplayName);

        ["grad_notification1",["SECTOR CAPTURED",format ["%1 was captured by %2.",_sectorName,_ownerName]]] remoteExec ["bis_fnc_showNotification",0,false];

        _points = _trigger getVariable "grad_sectors_pointsForCapture";
        [_newOwner,_points,_sectorName] call grad_points_fnc_addPoints;
        [_oldOwner,-_points,_sectorName] call grad_points_fnc_addPoints;

        _onSectorCaptured = _trigger getVariable [QGVAR(onSectorCaptured),{}];
        [_trigger,_newOwner,_oldOwner] call _onSectorCaptured;

        [_trigger] call grad_sectors_fnc_updateTasks;

        if (_trigger getVariable "grad_sectors_lockAfterCapture") exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    };

},1,[_this select 0,_previousCapturingSide]] call CBA_fnc_addPerFrameHandler;
