#include "component.hpp"

params [["_side",sideUnknown],["_mode","PRECHECK"]];

if (_mode == "PRECHECK") then {

    [{
        params ["_side","_handle"];
        if (!GVAR(roundInProgress)) exitWith {};

        if ({side _x == _side} count playableUnits == 0) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            [_side,"POSTCHECK"] call FUNC(startEliminationCheck);
        };
    },10,_side] call CBA_fnc_addPerFrameHandler;

} else {

    [{
        params ["_args","_handle"];
        _args params ["_side","_iteration"];

        if (EGVAR(common,gamePaused)) exitWith {};

        if (!GVAR(roundInProgress)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            [_side,"PRECHECK"] call FUNC(startEliminationCheck);
        };

        if ({side _x == _side} count playableUnits > 0) then {
            [_handle] call CBA_fnc_removePerFrameHandler;
            [_side,"PRECHECK"] call FUNC(startEliminationCheck);
        } else {
            _args set [1,_iteration + 1];
        };

        if (_iteration >= 10) exitWith {
            _winner = [WEST,EAST] select (_side == WEST);
            _isLastSector = [GVAR(activeSectorID),_winner] call FUNC(isLastSector);
            _sideDisplayName = [_side] call EFUNC(common,getSideDisplayName);
            [format ["%1 eliminated!",_sideDisplayName],_winner,_isLastSector] call FUNC(endRound);

            [_handle] call CBA_fnc_removePerFrameHandler;
            [_side,"PRECHECK"] call FUNC(startEliminationCheck);
        };
    },1,[_side,0]] call CBA_fnc_addPerFrameHandler;

};
