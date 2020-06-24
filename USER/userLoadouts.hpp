#include "loadout_blufor.hpp"
#include "loadout_opfor.hpp"
#include "loadout_civilian.hpp"

/*  Hier können eigene factions für grad-loadout eingetragen werden.
*   Anleitung im Wiki
*/

/*


// Zivis braunrote Hosen:
"LOP_U_TAK_Civ_Fatigue_07", // 60
"LOP_U_TAK_Civ_Fatigue_09",
"LOP_U_TAK_Civ_Fatigue_13"
// + V_LegStrapBag_olive_F  // 80

// ISIS , schwarze Hosen:
"LOP_U_ISTS_Fatigue_02" // 120
"LOP_U_ISTS_Fatigue_03"
"LOP_U_ISTS_Fatigue_04"
// + keine weste kriegen

// Zivis helle Hosen:
"LOP_U_TAK_Civ_Fatigue_01",
"LOP_U_TAK_Civ_Fatigue_02",
"LOP_U_TAK_Civ_Fatigue_06",
"LOP_U_TAK_Civ_Fatigue_08",
"LOP_U_TAK_Civ_Fatigue_10",
"LOP_U_TAK_Civ_Fatigue_11",
"LOP_U_TAK_Civ_Fatigue_14"


// Talis - mit Camooberteil  & Gerödel (ohne daß sie ne "Weste" trügen), ohne daß dunkelbraune Hosen dabeiwären
"LOP_U_AM_Fatigue_04",
"LOP_U_AM_Fatigue_04_3",
"LOP_U_AM_Fatigue_04_2",
"LOP_U_AM_Fatigue_03_3",
"LOP_U_AM_Fatigue_02",
"LOP_U_AM_Fatigue_02_2"


-----

dazu passende Westen:
"LOP_6sh46", // 120
"rhs_6sh46", // 40
"V_LegStrapBag_black_F", // Laws Of War , 80
"V_LegStrapBag_olive_F"  // Laws Of War , 80

_grp = createGroup civilian;
_p = getPos player;
{
    _p set [1, _p#1 + 2];
    _unit = _grp createUnit ["C_Man_1", _p, [], 0, "CAN_COLLIDE"];
    _unit addUniform _x;
} forEach [
    "LOP_U_AM_Fatigue_04", // 120
    "LOP_U_AM_Fatigue_04_3",
    "LOP_U_AM_Fatigue_04_2",
    "LOP_U_AM_Fatigue_03",
    "LOP_U_AM_Fatigue_03_3"
];



*/
