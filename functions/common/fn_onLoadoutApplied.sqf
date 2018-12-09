#include "component.hpp"

if (EGVAR(missionSettings,canTakeEnemyRadios)) exitWith {};

params [["_unit",objNull],["_loadout",[]]];

private _backpackArray = _loadout param [5,[]];
private _backpack = _backpackArray param [0,""];
if (_backpack == "") exitWith {};

if !(_backpack isKindOf "TFAR_Bag_Base") exitWith {};

[{!isNull backpackContainer _this},{
    (backpackContainer _this) setVariable [QGVAR(longRangeSide),side _this,true];
},_unit,2,{ERROR_1("Unit %1 has backpack in loadout, but backpackContainer timed out.",_this)}] call CBA_fnc_waitUntilAndExecute;
