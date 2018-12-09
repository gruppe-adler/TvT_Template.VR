#include "component.hpp"

if (!isServer) exitWith {};

params [["_logic",objNull],["_side",sideUnknown],["_mode","ATTACK"]];

if !(_side in [WEST,EAST]) exitWith {ERROR_1("Side %1 not supported in linearSD.",_side)};

private _vehicles = (synchronizedObjects _logic) select {
    _x isKindOf "LandVehicle" ||
    _x isKindOf "Air" ||
    _x isKindOf "Ship" ||
    _x isKindOf "ThingX"
};
private _sectors = _logic call bis_fnc_moduleTriggers;

private _attackerArrayVarName = [QGVAR(attackerVehiclesWest),QGVAR(attackerVehiclesEast)] select (_side == EAST);
private _defenderArrayVarName = [QGVAR(defenderVehiclesWest),QGVAR(defenderVehiclesEast)] select (_side == EAST);

{
    _vehArray = [
        typeOf _x,
        getPosASL _x,
        getDir _x,
        getItemCargo _x,
        getMagazineCargo _x,
        getWeaponCargo _x,
        getBackpackCargo _x,
        getObjectTextures _x,
        magazinesAllTurrets _x
    ];

    deleteVehicle _x;

    {

        if (toUpper _mode in ["ATTACK","BOTH"]) then {
            if (isNil {_x getVariable _attackerArrayVarName}) then {
                _x setVariable [_attackerArrayVarName,[]];
            };

            _sectorVehicles = _x getVariable _attackerArrayVarName;
            _sectorVehicles pushBack _vehArray;
        };

        if (toUpper _mode in ["DEFEND","BOTH"]) then {
            if (isNil {_x getVariable _defenderArrayVarName}) then {
                _x setVariable [_defenderArrayVarName,[]];
            };

            _sectorVehicles = _x getVariable _defenderArrayVarName;
            _sectorVehicles pushBack _vehArray;
        };

    } forEach _sectors;
} forEach _vehicles;
