#define MISSION_OPFOR_UNIFORMS "LOP_U_TAK_Civ_Fatigue_07","LOP_U_TAK_Civ_Fatigue_09","LOP_U_TAK_Civ_Fatigue_13" // capacity 80

class opfor: ind_me_terrorists {
    class AllUnits: AllUnits {
        uniform[] = {MISSION_OPFOR_UNIFORMS};
        vest[] = {"V_LegStrapBag_black_F","V_LegStrapBag_olive_F"}; // capacity 60
    };
    class Type: Type {
        class Officer_F: Officer_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
        };
        class Soldier_SL_F: Soldier_SL_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
        };
        class Soldier_TL_F: Soldier_TL_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
        };
        class Soldier_F: Soldier_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
        };
        class Soldier_AR_F: Soldier_AR_F {
            uniform[] = {MISSION_OPFOR_UNIFORMS};
        };
    };
};
