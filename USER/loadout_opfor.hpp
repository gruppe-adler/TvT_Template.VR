#define MISSION_OPFOR_UNIFORMS "UK3CB_TKM_O_U_01", "UK3CB_TKM_O_U_01_B", "UK3CB_TKM_O_U_01_C"
#define MISSION_OPFOR_HEADGEAR "UK3CB_H_Turban_Neckwrap_01_Red", "UK3CB_H_Turban_Neckwrap_02_Red", "UK3CB_H_Turban_Neckwrap_03_Red",

class opfor: ind_me_terrorists {
    class AllUnits: AllUnits {
        uniform[] = {MISSION_OPFOR_UNIFORMS};
        vest[] = {"UK3CB_V_Belt_KHK"};
    };
    class Type: Type {
        class Officer_F: Officer_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
            headgear[] = {MISSION_OPFOR_HEADGEAR};
            goggles = "";
        };
        class Soldier_SL_F: Soldier_SL_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
            headgear[] = {MISSION_OPFOR_HEADGEAR};
            goggles = "";
        };
        class Soldier_TL_F: Soldier_TL_F {            
            uniform[] = {MISSION_OPFOR_UNIFORMS};
            headgear[] = {MISSION_OPFOR_HEADGEAR};
            goggles = "";
        };
        class Soldier_F: Soldier_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
            headgear[] = {MISSION_OPFOR_HEADGEAR};
            goggles = "";
        };
        class Soldier_AR_F: Soldier_AR_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
            headgear[] = {MISSION_OPFOR_HEADGEAR};
            goggles = "";
        };
    };
};
