#include "component.hpp"

params ["_objective"];

// wait until objective object exists
if (isNull _objective) exitWith {
    [{!isNull _this},{[_this] call FUNC(addObjectiveInteractions)},_objective,10,{ERROR_1("Waiting for objective to be !null timed out: %1",_this)}] call CBA_fnc_waitUntilAndExecute;
};

// SEARCH INTERACTION ==========================================================
private _condition = {
    params ["_objective","_caller"];

    // get gamephase for team (other team might still be trying to capture FOB)
    private _gamephaseVar = [QGVAR(gamePhaseIDEast),QGVAR(gamePhaseIDWest)] select (side _caller == WEST);
    private _gamePhaseID = missionNamespace getVariable [_gamephaseVar,1];

    (_gamePhaseID == 1) &&
    {isNull (_objective getVariable [QGVAR(searchingPlayer),objNull])} &&
    {!(_objective getVariable [QGVAR(objectiveCompletedFinal),false])} &&
    {!(_objective getVariable [QGVAR(objectiveDestroyed),false])} &&
    {!((side _caller) in (_objective getVariable [QGVAR(objectiveCompletedSides),[]]))}
};

private _modifier = {
    params ["_objective","","","_actionData"];
    private _displayText = ["Take intel","Search for intel"] select ((_objective getVariable [QGVAR(searchTime),0]) > 0);
    _actionData set [1,_displayText];
};

private _action = [QGVAR(searchObjectiveInteraction),"","",{_this remoteExec [QFUNC(requestSearchObjective),2,false]},_condition,nil,nil,nil,nil,nil,_modifier] call ace_interact_menu_fnc_createAction;
[_objective,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;

// DESTROY INTERACTION =========================================================
private _condition = {
    params ["_objective","_caller"];

    // get gamephase for team (other team might still be trying to capture FOB)
    private _gamephaseVar = [QGVAR(gamePhaseIDEast),QGVAR(gamePhaseIDWest)] select (side _caller == WEST);
    private _gamePhaseID = missionNamespace getVariable [_gamephaseVar,1];

    (_gamePhaseID == 1) &&
    {!(_objective getVariable [QGVAR(objectiveDestroyed),false])} &&
    {!(_objective getVariable [QGVAR(singleUse),false])} &&
    {(side _caller) in (_objective getVariable [QGVAR(objectiveCompletedSides),[]])}
};

private _action = [QGVAR(destroyObjectiveInteraction),"Destroy","",{_this remoteExec [QFUNC(requestDestroyObjective),2,false]},_condition] call ace_interact_menu_fnc_createAction;
[_objective,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;
