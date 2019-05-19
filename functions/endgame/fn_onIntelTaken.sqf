#include "component.hpp"

params ["_caller"];

private _carrierSide = side _caller;
private _defenderSide = [WEST,EAST] select (_carrierSide == WEST);

private _sideUploadVar = [QGVAR(uploadEast),QGVAR(uploadWest)] select (_carrierSide == WEST);
private _uploadObj = missionNamespace getVariable [_sideUploadVar,objNull];

// complete pickup task for carrier side (use setTask in case task doesn't exist)
private _taskID = [GVAR(intel),_carrierSide,"intPu"] call FUNC(getTaskID);
private _taskText = GVAR(intel) getVariable [QGVAR(taskText),""];
private _taskTitle = GVAR(intel) getVariable [QGVAR(taskTitle),""];
[_taskID,_carrierSide,[_taskText,_taskTitle,"intel"],nil,"SUCCEEDED",nil,true] call BIS_fnc_setTask;

// update defend task with position
private _taskID = [GVAR(intel),_defenderSide,"intDef"] call FUNC(getTaskID);
private _taskText = "Prevent enemy delivery of intel. Position updated.";
private _taskTitle = "Prevent delivery";
[_taskID,_defenderSide,[_taskText,_taskTitle,"defend"],_uploadObj,"CREATED",nil,true] call BIS_fnc_setTask;

// create/activate delivery task for carrier side
private _taskID = [GVAR(intel),_carrierSide,"intDel"] call FUNC(getTaskID);
[_taskID,_carrierSide,["Upload intel at designated location.","Upload intel","upload"],_uploadObj,"CREATED",nil,true] call BIS_fnc_setTask;
