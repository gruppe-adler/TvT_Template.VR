#include "component.hpp"

params [["_endMessage",""],["_winner",sideUnknown],["_isLastSector",false]];

if !(GVAR(roundInProgress)) exitWith {INFO("A different ending is already in progress.")};

missionNamespace setVariable [QGVAR(roundInProgress),false,true];

// attacker is winner --> set sectors captured
if (_winner != GVAR(defendingSide)) then {
    {
        _x setVariable [QEGVAR(sectors,currentOwner),_winner];
        _x setVariable [QEGVAR(sectors,previousOwner),GVAR(defendingSide)];
        _x setVariable [QEGVAR(sectors,blocked),true];
        _x setVariable [QEGVAR(sectors,sideStrengths),[0,0,0]];
        [_x] call EFUNC(sectors,updateMarker);
        [_x,false] call EFUNC(sectors,updateTasks);
    } forEach GVAR(activeSectors);
};

private _winnerDisplayName = [_winner] call EFUNC(common,getSideDisplayName);
if (_isLastSector) then {
    ["",format ["%1 wins!",_winnerDisplayName],[_winner],[]] call EFUNC(endings,endMissionServer);

} else {

    _messagePic = ["cfg\gametypes\seize_ca","cfg\gametypes\defend_ca"] select (_winner == GVAR(defendingSide));
    _winMessage = format ["%1 wins the round.",_winnerDisplayName];
    [_endMessage,_winMessage,_messagePic] remoteExec [QFUNC(dynamicText),0,false];

    if (GVAR(isLastRound)) then {
        _currentSectorCountOpfor = {(_x getVariable [QEGVAR(sectors,currentOwner),sideUnknown]) == EAST} count EGVAR(sectors,sectorTriggers);

        _winners = [];
        _winText = "";
        switch (true) do {
            case (_currentSectorCountOpfor == GVAR(startingSectorCountOpfor)): {
                _winners = [EAST,WEST];
                _winText = "No sectors captured. Stalemate.";
            };
            case (_currentSectorCountOpfor > GVAR(startingSectorCountOpfor)): {
                _winners = [EAST];
                _winText = format ["%1 wins by sectors captured!",[EAST] call EFUNC(common,getSideDisplayName)];
            };
            case (_currentSectorCountOpfor < GVAR(startingSectorCountOpfor)): {
                _winners = [WEST];
                _winText = format ["%1 wins by sectors captured!",[WEST] call EFUNC(common,getSideDisplayName)];
            };
        };
        [EFUNC(endings,endMissionServer),["",_winText,_winners,[]],8] call CBA_fnc_waitAndExecute;

    } else {
        _nextActiveSector = GVAR(activeSectorID) + GVAR(opforDirection) * ([-1,1] select (_winner == EAST));
        [FUNC(startNewRound),[_nextActiveSector],5] call CBA_fnc_waitAndExecute;
    };
};
