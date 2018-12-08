#include "component.hpp"

params [["_start",true]];

[{
    if (EGVAR(common,gamePaused)) exitWith {};
    if (!GVAR(roundInProgress)) exitWith {};

    GVAR(roundTimeLeft) = (GVAR(roundTimeLeft) - 1) max 0;
    publicVariable QGVAR(roundTimeLeft);

    if (GVAR(roundTimeLeft) == 0) exitWith {

        // don't end round while a sector is being captured
        if !([] call FUNC(activeSectorBeingCaptured)) then {
            // fn_endRound sets GVAR(roundInProgress) to false
            ["Sectors defended!",GVAR(defendingSide)] call FUNC(endRound);
        };
    };

    if (GVAR(roundTimeLeft) in [1800,900,600,300,60]) then {
        _timeText = if (GVAR(roundTimeLeft) < 60) then {format ["%1s",GVAR(roundTimeLeft)]} else {format ["%1min",round (GVAR(roundTimeLeft)/60)]};
        _messageText = format ["There are %1 left in the round",_timeText];
        ["grad_notification1",["TIME",_messageText]] remoteExec ["bis_fnc_showNotification",0,false];
    };

},1,[]] call CBA_fnc_addPerFrameHandler;
