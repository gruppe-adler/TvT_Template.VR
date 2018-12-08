#include "component.hpp"

params [["_startingSectorID",-1],["_roundLength",60],["_opforDirection",1],["_dateAndTimeArray",[]]];

if (hasInterface) then {
    [] call FUNC(addTeleportAction);
    [] call FUNC(addChatCommands);

    if (didJIP) then {
        [{!isNull player},FUNC(movePlayerToRespawnPos),[]] call CBA_fnc_waitUntilAndExecute;
    };
};

if (isServer) then {

    GVAR(linearSDActive) = true;
    publicVariable QGVAR(linearSDActive);

    GVAR(roundInProgress) = false;
    publicVariable QGVAR(roundInProgress);

    GVAR(roundLength) = _roundLength;
    publicVariable QGVAR(roundLength);

    GVAR(roundTimeLeft) = _roundLength;
    publicVariable QGVAR(roundTimeLeft);

    GVAR(opforDirection) = _opforDirection;
    GVAR(dateAndTimeArray) = _dateAndTimeArray;
    GVAR(defendingSide) = sideUnknown;
    GVAR(allAttackerVehicles) = [];
    GVAR(isLastRound) = false;
    GVAR(startingSectorCountOpfor) = {(_x getVariable [QEGVAR(sectors,currentOwner),sideUnknown]) == EAST} count EGVAR(sectors,sectorTriggers);

    [_startingSectorID] call FUNC(startNewRound);
    [] call FUNC(startTimeout);
    [WEST] call FUNC(startEliminationCheck);
    [EAST] call FUNC(startEliminationCheck);
};
