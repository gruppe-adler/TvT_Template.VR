#include "component.hpp"

// delete spawned vehicles (players should all be dead and awaiting respawn right now)
{
    deleteVehicle _x;
} forEach GVAR(allAttackerVehicles);


private _objectTypesToDelete = [
    "WeaponHolder",
    "WeaponHolder_Single_F",
    "WeaponHolderSimulated",
    "WeaponHolderSimulated_Scripted",
    "GroundWeaponHolder",
    "GroundWeaponHolder_Scripted"
];

private _sectorTriggersCopy = +GVAR(sectorTriggers);
[{
    params ["_args","_handle"];
    _args params ["_objectTypesToDelete","_sectorTriggersCopy","_startTime"];

    if (count _sectorTriggersCopy == 0) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        INFO_1("Playzone cleanup finished in %1s",diag_tickTime - _startTime);
    };

    {
        (triggerArea _x) params ["_areaA","_areaB"];
        _searchRadius = (_areaA max _areaB) * 1.5;

        {deleteVehicle _x} forEach nearestObjects [
            getPos _x,
            _objectTypesToDelete,
            _searchRadius
        ];
    } forEach (_sectorTriggersCopy deleteAt 0);

},0.2,[_objectTypesToDelete,_sectorTriggersCopy,diag_tickTime]] call CBA_fnc_addPerFrameHandler;
