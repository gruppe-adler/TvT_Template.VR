#include "component.hpp"

params ["_intel"];

// wait until intel object exists
if (isNull _intel) exitWith {
    [{!isNull _this},{[_this] call FUNC(addIntelInteraction)},_intel,10,{ERROR_1("Waiting for intel to be !null timed out: %1",_this)}] call CBA_fnc_waitUntilAndExecute;
};

private _condition = {
    params ["_intel","_caller"];

    // get gamephase for team (other team might still be trying to capture FOB)
    private _gamephaseVar = [QGVAR(gamePhaseEast),QGVAR(gamePhaseWest)] select (side _caller == WEST);
    private _gamePhase = missionNamespace getVariable [_gamephaseVar,1];

    !(_intel getVariable [QGVAR(intelComplete),false]) &&
    {_gamePhase == 1}
};

private _modifier = {
    params ["_intel","","","_actionData"];
    private _displayText = ["Take intel","Search for intel"] select ((_intel getVariable [QGVAR(searchTime),0]) > 0);
    _actionData set [1,_displayText];
};

private _action = [QGVAR(searchIntelInteraction),"","",{_this call FUNC(searchIntel)},_condition,nil,nil,nil,nil,nil,_modifier] call ace_interact_menu_fnc_createAction;
[_intel,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;
