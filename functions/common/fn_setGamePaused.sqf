#include "component.hpp"

params [["_paused",true]];

if (GVAR(gamePaused) isEqualTo _paused) exitWith {
    (format ["Game is already %1",["unpaused","paused"] select _paused]) remoteExec ["systemChat",remoteExecutedOwner,false];
};

missionNamespace setVariable [QGVAR(gamePaused),_paused,true];

if (_paused) then {
    GVAR(prePauseTimeMultiplier) = timeMultiplier;
    setTimeMultiplier 0.1;

    _pauseMessage = "
        <t valign='top' align='center' font='PuristaLight' shadow='0' size='4'>GAME IS PAUSED</t><br/>
        <t valign='top' align='center' font='RobotoCondensedLight' shadow='0' size='1.5'>Please don't move</t>
    ";
    [QGVAR(pauseLayer),[_pauseMessage,"BLACK OUT",1,true,true]] remoteExec ["cutText",0,false];

} else {
    setTimeMultiplier (missionNamespace getVariable [QGVAR(prePauseTimeMultiplier),1]);

    [QGVAR(pauseLayer),["","BLACK IN",1,true,true]] remoteExec ["cutText",0,false];
};
