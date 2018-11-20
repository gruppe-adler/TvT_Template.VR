#include "component.hpp"

if (missionNamespace getVariable ["grad_endings_endingInProgress",false]) exitWith {};
missionNamespace setVariable ["grad_endings_endingInProgress",true];

_this spawn {
    params ["_configName","_winText","_winners","_winTextParams"];
    private ["_winText","_winners","_winTextParams"];

    INFO_1("Ending %1 in progress.",_configName);

    if (isNil "_winText") then {
        _winText = [missionConfigFile >> "CfgWinConditions" >> _configName,"winText",""] call BIS_fnc_returnConfigEntry;
    };
    if (isNil "_winners") then {
        _winners = ([missionConfigFile >> "CfgWinConditions" >> _configName,"winners",[]] call BIS_fnc_returnConfigEntry) apply {call compile _x};
    };
    _winTextParams = ([missionConfigFile >> "CfgWinConditions" >> _configName,"winTextParams",[]] call BIS_fnc_returnConfigEntry) apply {call compile _x};

    _winText = "<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>" + _winText + "</t>";

    _text = format ([_winText] + _winTextParams);

    // show end title
    [_text,0,0,4,2] remoteExec ["BIS_fnc_dynamicText",0,false];
    INFO_3("%1 %2 %3",_winText,_text,_winners);
    sleep 5;

    // show points
    if (({[_x] call grad_points_fnc_getPoints > 0} count [WEST,EAST,INDEPENDENT,CIVILIAN]) > 0) then {
        [] remoteExecCall ["grad_points_fnc_displayPoints",0,false];
        sleep 16;
    };

    // show replay
    [] call GRAD_replay_fnc_stopRecord;
    [_winners] remoteExec ["grad_endings_fnc_endMissionClient",0,false];
};
