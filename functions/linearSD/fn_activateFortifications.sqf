#include "component.hpp"

{
    _hide = !(_forEachIndex in [GVAR(attackerSectorID),GVAR(activeSectorID)]);

    {
        {
            _x hideObjectGlobal _hide;
        } forEach (_x getVariable [QGVAR(fortifications),[]]);
    } forEach _x;
} forEach GVAR(sectorTriggers);
