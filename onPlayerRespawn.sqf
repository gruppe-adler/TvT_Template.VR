["Terminate"] call BIS_fnc_EGSpectator;

if (([missionConfigFile >> "missionsettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 1) then {
    _this call grad_waverespawn_fnc_onPlayerRespawn;
};
