#include "component.hpp"

params ["_trigger"];
INFO_1("PFH for %1 starting.",_trigger getVariable "grad_sectors_sectorName");

[{
    params ["_trigger","_handle"];
    if (isNull _trigger) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        ERROR("A sector trigger is null. Exiting PFH.");
    };

    _list = list _trigger;
    if (isNil "_list") exitWith {};

    _oldOwner = _trigger getVariable "grad_sectors_currentOwner";
    _pps = _trigger getVariable "grad_sectors_pointsPerSecond";
    if (_pps > 0) then {
        _categoryName = format ["Held %1",_trigger getVariable "grad_sectors_sectorName"];
        [_oldOwner,_pps,_categoryName] call grad_points_fnc_addPoints;
    };

    _countTotal = (count _list) - (sideLogic countSide _list) - (CIVILIAN countSide _list);
    if (_countTotal == 0) exitWith {};

    _captureSides = _trigger getVariable "grad_sectors_captureSides";
    _countWest = if (WEST in _captureSides) then {WEST countSide _list} else {0};
    _countEast = if (EAST in _captureSides) then {EAST countSide _list} else {0};
    _countIndep = if (INDEPENDENT in _captureSides) then {INDEPENDENT countSide _list} else {0};

    (_trigger getVariable "grad_sectors_sideStrenghts") params ["_strengthWest","_strengthEast","_strengthIndep"];
    _strengthWest = (_strengthWest + (_countWest/_countTotal - 0.5)/15) max 0 min 1;
    _strengthEast = (_strengthEast + (_countEast/_countTotal - 0.5)/15) max 0 min 1;
    _strengthIndep = (_strengthIndep + (_countIndep/_countTotal - 0.5)/15) max 0 min 1;
    _trigger setVariable ["grad_sectors_sideStrenghts",[_strengthWest,_strengthEast,_strengthIndep]];

    _newOwner = if (_strengthWest == 1) then {WEST} else {if (_strengthEast == 1) then {EAST} else {if (_strengthIndep == 1) then {INDEPENDENT} else {_oldOwner}}};

    if (_newOwner != _oldOwner) then {
        _trigger setVariable ["grad_sectors_previousOwner",_oldOwner];
        _trigger setVariable ["grad_sectors_currentOwner",_newOwner];
        [_trigger] call grad_sectors_fnc_updateMarker;
        [_trigger] call grad_sectors_fnc_notification;

        _sectorName = _trigger getVariable "grad_sectors_sectorName";
        if (_sectorName == "") then {_sectorName = "A sector"};
        _ownerName = switch (_newOwner) do {
            case (WEST): {"BLUFOR"};
            case (EAST): {"OPFOR"};
            case (INDEPENDENT): {"INDEPENDENT"};
        };

        ["grad_notification1",["SECTOR CAPTURED",format ["%1 was captured by %2.",_sectorName,_ownerName]]] remoteExec ["bis_fnc_showNotification",0,false];

        _points = _trigger getVariable "grad_sectors_pointsForCapture";
        [_newOwner,_points,_sectorName] call grad_points_fnc_addPoints;
        [_oldOwner,-_points,_sectorName] call grad_points_fnc_addPoints;

        [_trigger] call grad_sectors_fnc_updateTasks;

        if (_trigger getVariable "grad_sectors_lockAfterCapture") exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    };

},1,_this select 0] call CBA_fnc_addPerFrameHandler;
