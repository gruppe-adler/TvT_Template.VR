/*    Teleports unit
*
*     Params:
*     0:    unit
*     1:    destination
*/

params ["_unit",["_pos", [0,0,0]],["_onTPStart",{}],["_onTPEnd",{}],["_codeParams",[]],["_fade",true]];

if (!local _unit) exitWith {};

if (_fade && ACE_player == _unit) then {
    titleCut ["","BLACK OUT",0];
    titleCut ["","BLACK IN",1.5];
};

_codeParams call _onTPStart;

_unit allowDamage false;
_unit setPos _pos;
[{
    params ["_unit","_onTPEnd","_codeParams"];
    _unit allowDamage true;
    _codeParams call _onTPEnd;
}, [_unit,_onTPEnd,_codeParams], 2] call CBA_fnc_waitAndExecute;
