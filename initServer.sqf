["Initialize", [true]] call BIS_fnc_dynamicGroups;

private _preparationTime = ["PREPARATION_TIME", 0] call BIS_fnc_getParamValue;
if (_preparationTime > 0) then {[_preparationTime] call grad_common_fnc_startPreparationTime};
