#include "component.hpp"

params ["_winName",["_presetParams",[]]];

_presetParams = _presetParams apply {call compile _x};

//CREATE TASK ==================================================================
/*private _winners = [missionConfigFile >> "CfgWinConditions" >> _winName, "winners",[]] call BIS_fnc_returnConfigEntry;
_winners = _winners apply {call compile _x};

private _taskID = "taskDestroy";
{_taskID = _taskID + "_w" + str _x} forEach _winners;
{_taskID = _taskID + "_l" + str _x} forEach _sides;

private _taskDesc = "";
private _typeID = -1;
{
    _lastTypeID = _typeID;
    _typeID = [0,1] select (name _x == "Error: No unit");

    _descriptor = switch (true) do {
        case (_forEachIndex == 0): {["Kill ","Destroy "] select _typeID};
        case (_lastTypeID != _typeID): {["kill ","destroy "] select _typeID};
        default {""};
    };
    _conjunction = switch (true) do {
        case (_forEachIndex == 0): {""};
        case (_lastTypeID != _typeID): {" and "};
        default {", "};
    };
    _name = if (_typeID == 0) then {name _x} else {
        "the " + ([configFile >> "CfgVehicles" >> typeOf _x,"displayName","object"] call BIS_fnc_returnConfigEntry)
    };

    _taskDesc = _taskDesc + _conjunction + _descriptor + _name;
} forEach _presetParams;
_taskDesc = _taskDesc + ".";

[_taskID,_winners,[_taskDesc,"Destroy",""],objNull,"AUTOASSIGNED",3,true,true,"destroy"] call BIS_fnc_setTask;*/


//PFH ==========================================================================
[{
    params ["_args","_handle"];
    _args params ["_winName","_presetParams"];

    if ({alive _x} count _presetParams == 0) exitWith {
        [_winName] call grad_endings_fnc_endMissionServer;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
} , 10, [_winName,_presetParams]] call CBA_fnc_addPerFrameHandler;
