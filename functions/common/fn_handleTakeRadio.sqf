#include "component.hpp"

if (EGVAR(missionSettings,canTakeEnemyRadios)) exitWith {};

params ["_unit","_container","_item"];

private _isHandheld = _item isKindOf ["ItemRadio", configFile >> "CfgWeapons"];
private _isLongrange = _item isKindOf "TFAR_Bag_Base";

if (!_isHandheld && !_isLongrange) exitWith {};

if (_isHandheld) then {

    // handheld radio that has not been instanciated --> anyone can pick it up
    if (_item isEqualTo ([configFile >> "CfgWeapons" >> _item,"tf_parent",""] call BIS_fnc_returnConfigEntry)) exitWith {};

    // side radio arrays are filled in fn_receiveSwRadioSide
    _sideID = [WEST,EAST,INDEPENDENT,CIVILIAN] find (side _unit);
    if (_sideID < 0) exitWith {ERROR_1("Unit %1 unknown side.",_unit)};
    _radioArrayVarName = [QGVAR(radiosWest),QGVAR(radiosEast),QGVAR(radiosIndependent),QGVAR(radiosCivilian)] select _sideID;

    // remove radio if not allowed
    if !(_item in (missionNamespace getVariable [_radioArrayVarName,[]])) then {
        systemChat "You cannot take this radio.";
        playSound "3DEN_notificationWarning";

        _unit removeItem _item;
        _unit unlinkItem _item;

        if (isNull _container || {(typeOf _container) in ["WeaponHolder","WeaponHolder_Single_F","WeaponHolderSimulated","WeaponHolderSimulated_Scripted","GroundWeaponHolder","GroundWeaponHolder_Scripted"]}) then {
            _container = createVehicle ["groundWeaponHolder", getPos _unit, [], 0, "can_Collide"];
        };
        _container addItemCargoGlobal [_item,1];
    };


} else {

    private _previousFrequencies = ((backpackContainer _unit) getVariable ["radio_settings",[]]) param [2,[]];

    // wait until unit has the new backpackContainer
    private _waitCondition = {
        params ["_unit","_item","_container","_previousFrequencies"];

        !(isNull backpackContainer _unit) &&
        {(backpack _unit) == _item} &&
        {
            _newFrequencies = ((backpackContainer _unit) getVariable ["radio_settings",[]]) param [2,[]];
            !(_newFrequencies isEqualTo _previousFrequencies)
        }
    };

    [_waitCondition,{
        params ["_unit","_item","_container"];

        _backpackContainer = backpackContainer _unit;
        _unitSide = side _unit;

        if (_unitSide != (_backpackContainer getVariable [QGVAR(longRangeSide),_unitSide])) then {
            systemChat "You cannot take this radio.";
            playSound "3DEN_notificationWarning";

            if (backpack _unit == _item) then {removeBackpackGlobal _unit} else {_unit removeItem _item};
        };
    },[_unit,_item,_container,_previousFrequencies],1,{ERROR_1("Unit %1 picked up a backpack, but backpackContainer timed out.",_this select 0)}] call CBA_fnc_waitUntilAndExecute;
};
