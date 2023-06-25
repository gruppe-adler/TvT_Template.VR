#include "component.hpp"

params ["_winnerPhase2"];

// cancel objectives tasks first
{
    private _taskIDVarname = [QGVAR(taskIDEast),QGVAR(taskIDWest)] select (_x == WEST);
    {
        private _taskID = _x getVariable [_taskIDVarname,""];
        if ([_taskID] call BIS_fnc_taskExists && {!(([_taskID] call BIS_fnc_taskState) in ["FAILED","SUCCEEDED"])}) then {
            [_taskID,"CANCELED"] call BIS_fnc_taskSetState;
        };
    } forEach GVAR(objectives);
} forEach [WEST,EAST];

private _loserPhase2 = [WEST,EAST] select (_winnerPhase2 == WEST);

// create pickup task for winner
private _taskID = [GVAR(intel),_winnerPhase2,"intPu"] call FUNC(getTaskID);
private _taskPos = getPos GVAR(intel);

[_taskID,_winnerPhase2,["Pickup the intel.","Pickup intel","intel"],_taskPos,"CREATED",nil,true] call BIS_fnc_setTask;

// create defend task for loser (without position until intel is picked up)
private _taskID = [GVAR(intel),_loserPhase2,"intDef"] call FUNC(getTaskID);
private _taskText = "Prevent enemy delivery of intel. Position currently unknown.";
private _taskTitle = "Prevent delivery";

[_taskID,_loserPhase2,[_taskText,_taskTitle,"defend"],nil,"CREATED",nil,true] call BIS_fnc_setTask;

{missionNamespace setVariable [_x,2,true]} forEach [QGVAR(gamePhaseIDEast),QGVAR(gamePhaseIDWest)];
