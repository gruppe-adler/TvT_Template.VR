#include "component.hpp"

//BLUFOR =======================================================================
[{
    if (EGVAR(common,gamePaused)) exitWith {};

    [QGVAR(WAVERESPAWNSTATUSBLU),[WEST] call FUNC(getStatus)] call CBA_fnc_publicVariable;

    //dont execute while respawning is possible
    if (GVAR(WAVERESPAWNBLU)) exitWith {};

    //start countdown once first player is added to wave
    if (count GVAR(wavePlayersBlu) > 0) then {
        GVAR(WAVERESPAWNTIMELEFTBLU) = (GVAR(WAVERESPAWNTIMELEFTBLU) - 1) max 0;
        publicVariable QGVAR(WAVERESPAWNTIMELEFTBLU);
    } else {
        [QGVAR(WAVERESPAWNTIMELEFTBLU),GVAR(WAVERESPAWNTIMEBLU)] call CBA_fnc_publicVariable;
    };

    //enable respawning when wave is full
    if (["WEST"] call FUNC(canRespawn)) then {

        GVAR(WAVERESPAWNBLU) = true;
        publicVariable QGVAR(WAVERESPAWNBLU);
        INFO("Respawning now possible for Blufor.");

        [{
            GVAR(WAVERESPAWNBLU) = false;
            publicVariable QGVAR(WAVERESPAWNBLU);
            GVAR(WAVERESPAWNTIMELEFTBLU) = GVAR(WAVERESPAWNTIMEBLU);
            publicVariable QGVAR(WAVERESPAWNTIMELEFTBLU);
            INFO("Respawning no longer possible for Blufor.");
        },[],(GVAR(RESPAWNWAVEEXTRATIME) max 7)] call CBA_fnc_waitAndExecute;
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;


//OPFOR ========================================================================
[{
    if (EGVAR(common,gamePaused)) exitWith {};

    [QGVAR(WAVERESPAWNSTATUSOPF),[EAST] call FUNC(getStatus)] call CBA_fnc_publicVariable;

    //dont execute while respawning is possible
    if (GVAR(WAVERESPAWNOPF)) exitWith {};

    //start countdown once first player is added to wave
    if (count GVAR(wavePlayersOpf) > 0) then {
        GVAR(WAVERESPAWNTIMELEFTOPF) = (GVAR(WAVERESPAWNTIMELEFTOPF) - 1) max 0;
        publicVariable QGVAR(WAVERESPAWNTIMELEFTOPF);
    } else {
        [QGVAR(WAVERESPAWNTIMELEFTOPF),GVAR(WAVERESPAWNTIMEOPF)] call CBA_fnc_publicVariable;
    };

    //enable respawning when wave is full
    if (["EAST"] call FUNC(canRespawn)) then {

        GVAR(WAVERESPAWNOPF) = true;
        publicVariable QGVAR(WAVERESPAWNOPF);
        INFO("Respawning now possible for Opfor.");

        [{
            GVAR(WAVERESPAWNOPF) = false;
            publicVariable QGVAR(WAVERESPAWNOPF);
            GVAR(WAVERESPAWNTIMELEFTOPF) = GVAR(WAVERESPAWNTIMEOPF);
            publicVariable QGVAR(WAVERESPAWNTIMELEFTOPF);
            INFO("Respawning no longer possible for Opfor.");
        },[],(GVAR(RESPAWNWAVEEXTRATIME) max 7)] call CBA_fnc_waitAndExecute;
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;


//INDEP ========================================================================
[{
    if (EGVAR(common,gamePaused)) exitWith {};
        
    [QGVAR(WAVERESPAWNSTATUSIND),[INDEPENDENT] call FUNC(getStatus)] call CBA_fnc_publicVariable;

    //dont execute while respawning is possible
    if (GVAR(WAVERESPAWNIND)) exitWith {};

    //start countdown once first player is added to wave
    if (count GVAR(wavePlayersInd) > 0) then {
        GVAR(WAVERESPAWNTIMELEFTIND) = (GVAR(WAVERESPAWNTIMELEFTIND) - 1) max 0;
        publicVariable QGVAR(WAVERESPAWNTIMELEFTIND);
    } else {
        [QGVAR(WAVERESPAWNTIMELEFTIND),GVAR(WAVERESPAWNTIMEIND)] call CBA_fnc_publicVariable;
    };

    //enable respawning when wave is full
    if (["INDEPENDENT"] call FUNC(canRespawn)) then {

        GVAR(WAVERESPAWNIND) = true;
        publicVariable QGVAR(WAVERESPAWNIND);
        INFO("Respawning now possible for Independent.");

        [{
            GVAR(WAVERESPAWNIND) = false;
            publicVariable QGVAR(WAVERESPAWNIND);
            GVAR(WAVERESPAWNTIMELEFTIND) = GVAR(WAVERESPAWNTIMEIND);
            publicVariable QGVAR(WAVERESPAWNTIMELEFTIND);
            INFO("Respawning no longer possible for Independent.");
        },[],(GVAR(RESPAWNWAVEEXTRATIME) max 7)] call CBA_fnc_waitAndExecute;
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;
