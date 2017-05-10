/*  Sets factions for grad-loadout
*
*/

#include "component.hpp"

grad_missionsettings_loadoutFactionBlu = [missionConfigFile >> "missionsettings","loadoutFactionBlu",""] call BIS_fnc_returnConfigEntry;
grad_missionsettings_loadoutFactionOpf = [missionConfigFile >> "missionsettings","loadoutFactionOpf",""] call BIS_fnc_returnConfigEntry;
grad_missionsettings_loadoutFactionInd = [missionConfigFile >> "missionsettings","loadoutFactionInd",""] call BIS_fnc_returnConfigEntry;

if (grad_missionsettings_loadoutFactionBlu != "") then {
    ["BLU_F", grad_missionsettings_loadoutFactionBlu] call GRAD_Loadout_fnc_FactionSetLoadout;
};
if (grad_missionsettings_loadoutFactionOpf != "") then {
    ["OPF_F", grad_missionsettings_loadoutFactionOpf] call GRAD_Loadout_fnc_FactionSetLoadout;
};
if (grad_missionsettings_loadoutFactionInd != "") then {
    ["IND_F", grad_missionsettings_loadoutFactionInd] call GRAD_Loadout_fnc_FactionSetLoadout;
};

GRAD_loadoutFactionSet = true;
