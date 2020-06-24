#include "component.hpp"

private _fobs = [
    [
        [east, trigger_fob_opf],
        [west, trigger_fob_blu]
    ], ""
] call CBA_fnc_hashCreate;


[_fobs, {
    [_key, _value] params [
        ["_side", sideUnknown, [sideUnknown]],
        ["_fobTrigger", objNull, [objNull]]
    ];
    private _count = 0;
    if (!([_side] call EFUNC(grievances,isArmyRetaliating))) then {
        _count = { _x inArea _fobTrigger} count ((getPos _fobTrigger) nearEntities ["Sheep_random_F", 100]);
    };
    [_side, _count, "sheep in FOB"] call grad_points_fnc_setPoints;
}]  call CBA_fnc_hashEachPair;
