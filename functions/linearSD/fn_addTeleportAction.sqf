#include "component.hpp"

private _insertChildrenFunc = {
    params ["_target", "_player", "_params"];

    private _actions = [];
    private _sectors = [missionNamespace getVariable [QGVAR(sectorsWest),[]],missionNamespace getVariable [QGVAR(sectorsEast),[]]] select (playerSide == EAST);
    {
        _action = [
            format ["grad_linearSD_teleportAction_%1",_forEachIndex],
            _x getVariable [QEGVAR(sectors,sectorName),"ERROR: Sector unknown"],
            "",
            {
                params ["_unit","",["_sector",objNull]];
                if (isNull _sector) exitWith {systemChat "ERROR: Sector unknown."};

                _pos = _sector getVariable [QGVAR(respawnPosition),(getPos _sector) findEmptyPosition [0,100,"B_Soldier_F"]];
                if (count _pos == 0) then {_pos = getPos _sector};
                [_unit,_pos] call EFUNC(common,teleport);
            },
            {true},
            {},
            _x
        ] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action,[],_target];
    } forEach _sectors;

    _actions
};

private _action = [
    QGVAR(teleportAction),
    "Teleport",
    "",
    {},
    {!(missionNamespace getVariable [QGVAR(roundInProgress),true])},
    _insertChildrenFunc
] call ace_interact_menu_fnc_createAction;


["CAManBase",1,["ACE_SelfActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
