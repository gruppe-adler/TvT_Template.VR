#include "component.hpp"

params [["_winners",[]]];

waitUntil {missionNamespace getVariable ["REPLAY_FINISHED",false]};
["end1",playerSide in _winners,true,true,true] spawn BIS_fnc_endMission;
