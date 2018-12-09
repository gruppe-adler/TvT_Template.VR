#include "component.hpp"

if (!hasInterface) exitWith {};
if !(playerSide in [WEST,EAST]) exitWith {};

if (isNil QGVAR(playerRespawnEH)) then {
    GVAR(playerRespawnEH) = player addEventHandler ["Respawn",{
        params ["_newUnit","_oldUnit"];

        ["Terminate"] call BIS_fnc_EGSpectator;

        // teleport to respawn position manually, because players who died before new marker position was set do not get the updated position
        _respawnMarker = ["respawn_west","respawn_east"] select (playerSide == EAST);
        _pos = (getMarkerPos _respawnMarker) findEmptyPosition [0,30,"B_Soldier_F"];
        if (_pos isEqualTo []) then {_pos = getMarkerPos _respawnMarker};
        [player,_pos,nil,nil,nil,false] call EFUNC(common,teleport);

        setPlayerRespawnTime 99999;

        // manually assign old curator logic to new unit - for some reason it gets lost across respawns
        _assignedCuratorLogic = getAssignedCuratorLogic _oldUnit;
        deleteVehicle _oldUnit;

        if (!isNull _assignedCuratorLogic) then {
            [_newUnit,_assignedCuratorLogic] remoteExecCall ["assignCurator",2,false];
        };
    }];
};

[{
    setPlayerRespawnTime 5;
    forceRespawn player;
},[],1] call CBA_fnc_waitAndExecute;
