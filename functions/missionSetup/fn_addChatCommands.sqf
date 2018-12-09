#include "component.hpp"

["grad",{
    params ["_commandType"];

    private _availableCommands = [
        "pause",
        "unpause"
    ];

    private _fnc_default = {
        systemChat format ["%1 is not a grad chatcommand.",_commandType];
        systemChat format ["Available commands are %1",_availableCommands];
    };

    private _fnc_pause = {
        [true] remoteExec [QEFUNC(common,setGamePaused),2,false];
    };

    private _fnc_unPause = {
        [false] remoteExec [QEFUNC(common,setGamePaused),2,false];
    };

    switch (toLower _commandType) do {
        case ("pause"): _fnc_pause;
        case ("unpause"): _fnc_unPause;
        default _fnc_default;
    };

},"admin"] call CBA_fnc_registerChatCommand;
