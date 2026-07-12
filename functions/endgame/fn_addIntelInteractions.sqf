#include "component.hpp"

params ["_intel"];

// wait until intel object exists
if (isNull _intel) exitWith {
    [{!isNull _this},{[_this] call FUNC(addIntelInteractions)},_intel,10,{ERROR_1("Waiting for intel to be !null timed out: %1",_this)}] call CBA_fnc_waitUntilAndExecute;
};

private _condition = {
    params ["_intel","_caller"];

    // get gamephase for team (other team might still be trying to capture FOB)
    private _gamephaseVar = [QGVAR(gamePhaseIDEast),QGVAR(gamePhaseIDWest)] select (side _caller == WEST);
    private _gamePhaseID = missionNamespace getVariable [_gamephaseVar,1];

    (_gamePhaseID == 2)
};

private _action = [QGVAR(takeIntelInteraction),"Take intel","",{_this remoteExec [QFUNC(requestTakeIntel),2,false]},_condition] call ace_interact_menu_fnc_createAction;
[_intel,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;
