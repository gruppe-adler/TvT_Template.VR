#include "component.hpp"

["grad-linearSD",{
    params ["_commandType"];

    private _availableCommands = [
        "lastRound"
    ];

    private _fnc_default = {
        systemChat format ["%1 is not a linearSD chatcommand.",_commandType];
        systemChat format ["Available commands are %1",_availableCommands];
    };

    private _fnc_lastRound = {
        [] remoteExec [QFUNC(setLastRound),2,false];        
    };

    switch (toLower _commandType) do {
        case ("lastround"): _fnc_lastRound;
        default _fnc_default;
    };

},"admin"] call CBA_fnc_registerChatCommand;
