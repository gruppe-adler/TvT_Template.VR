enableSaving [false, false];
enableEngineArtillery false;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

player addEventHandler ["HandleRating",{0}];
player addEventHandler ["Take",{_this call grad_common_fnc_handleTakeRadio}];
player addEventHandler ["Take",{_this call grad_common_fnc_handleScopeChange}];
