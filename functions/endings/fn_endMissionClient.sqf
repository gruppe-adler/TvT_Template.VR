#include "component.hpp"

_this spawn {
    params ["_configName","_winText","_winners","_winTextParams"];
    private ["_winText","_winners","_winTextParams"];

    if (isNil "_winText") then {
        _winText = [missionConfigFile >> "CfgWinConditions" >> _configName,"winText",""] call BIS_fnc_returnConfigEntry;
    };
    if (isNil "_winners") then {
        _winners = ([missionConfigFile >> "CfgWinConditions" >> _configName,"winners",[]] call BIS_fnc_returnConfigEntry) apply {call compile _x};
    };
    private _winTextParams = ([missionConfigFile >> "CfgWinConditions" >> _configName,"winTextParams",[]] call BIS_fnc_returnConfigEntry) apply {call compile _x};

    _winText = "<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>" + _winText + "</t>";

    _text = format ([_winText] + _winTextParams);
    [_text,0,0,4,2] spawn BIS_fnc_dynamicText;

    diag_log [_winText,_text,_winners];

    sleep 5;

    if (({[_x] call grad_points_fnc_getPoints > 0} count [WEST,EAST,INDEPENDENT,CIVILIAN]) > 0) then {
        [] call grad_points_fnc_displayPoints;
        sleep 16;
    };

    ["end1",playerSide in _winners,true,true,true] spawn BIS_fnc_endMission;
};
