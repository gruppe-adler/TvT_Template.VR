#include "component.hpp"

_this spawn {
    params ["_configName"];

    private _winners = ([missionConfigFile >> "CfgWinConditions" >> _configName,"winners",[]] call BIS_fnc_returnConfigEntry) apply {call compile _x};
    private _winText = [missionConfigFile >> "CfgWinConditions" >> _configName,"winText",""] call BIS_fnc_returnConfigEntry;

    _text = format ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>" + _winText + "</t>", round (CBA_missionTime/60)];
    [_text,0,0,4,2] spawn BIS_fnc_dynamicText;

    diag_log [_winText,_text,_winners];

    sleep 5;

    ["end1",playerSide in _winners,true,true,true] spawn BIS_fnc_endMission;
};
