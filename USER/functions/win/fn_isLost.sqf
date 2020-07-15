#include "component.hpp"


private _playersLost = ({ (incapacitatedState _x) in ["HEALTHY", "INJURED"]} count allPlayers) isEqualTo [];

if (_playersLost) then {
    ["moreSheep", "CANCELED", false] call BIS_fnc_taskSetState;
    INFO("both  sides dont have players left");
};

_playersLost;
