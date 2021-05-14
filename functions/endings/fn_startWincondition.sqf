#include "component.hpp"

params ["_winCondition"];

private _condition = compile ([_winCondition,"condition","false"] call BIS_fnc_returnConfigEntry);
private _checkInterval = [_winCondition,"checkInterval",1] call BIS_fnc_returnConfigEntry;
private _winName = configName _winCondition;

INFO_1("Initialized wincondition %1.",_winName);

ISNILS(GVAR(checkPfhs),[]);

GVAR(checkPfhs) pushBackUnique ([{
    params ["_args", ""];
    _args params ["_condition","_winName"];

    if (call _condition) exitWith {
        INFO_1("win condition %1 fulfilled, stopping all win condition checks", _winName);
        {
            [_x] call CBA_fnc_removePerFrameHandler;
        } forEach GVAR(checkPfhs);        
        [_winName] call grad_endings_fnc_endMissionServer;
        
    };
},_checkInterval,[_condition,_winName]] call CBA_fnc_addPerFrameHandler);
