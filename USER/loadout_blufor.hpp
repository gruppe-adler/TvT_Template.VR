#define MISSION_BLUFOR_UNIFORMS "UK3CB_TKM_I_U_05", "UK3CB_TKM_I_U_05_B", "UK3CB_TKM_I_U_05_C",
#define MISSION_BLUFOR_HEADGEAR "UK3CB_H_Turban_Neckwrap_01_Blu", "UK3CB_H_Turban_Neckwrap_02_Blu", "UK3CB_H_Turban_Neckwrap_03_Blu",

class blufor: ind_me_terrorists {
    class AllUnits: AllUnits {
        uniform[] = {MISSION_BLUFOR_UNIFORMS};
        vest[] = {"UK3CB_V_Belt_KHK"}; // die Hälfte nix, die andere Hälfte 40
    };
    class Type: Type {
        class Officer_F: Officer_F {
            uniform[] = {MISSION_BLUFOR_UNIFORMS};
            headgear[] = {MISSION_BLUFOR_HEADGEAR};
            goggles = "";
        };
        class Soldier_SL_F: Soldier_SL_F {
            uniform[] = {MISSION_BLUFOR_UNIFORMS};
            headgear[] = {MISSION_BLUFOR_HEADGEAR};
            goggles = "";
        };
        class Soldier_TL_F: Soldier_TL_F {
            uniform[] = {MISSION_BLUFOR_UNIFORMS};
            headgear[] = {MISSION_BLUFOR_HEADGEAR};
            goggles = "";
        };
        class Soldier_F: Soldier_F {
            uniform[] = {MISSION_BLUFOR_UNIFORMS};
            headgear[] = {MISSION_BLUFOR_HEADGEAR};
            goggles = "";
        };
        class Soldier_AR_F: Soldier_AR_F {
            uniform[] = {MISSION_BLUFOR_UNIFORMS};
            headgear[] = {MISSION_BLUFOR_HEADGEAR};
            goggles = "";
        };
    };
};

/*

Primärwaffen:

R+PL  : Makarov sekundär
TL+SL : rhs_weap_savz61 primär
SL+PL : signalpistole sekundär

    Schrotflinte:
        "rhs_weap_Izh18";
            "rhsgref_1Rnd_Slug";
            "rhsgref_1Rnd_00Buck";
    Uzi: -- leider mit schrecklicher Lochkimme
        "rhs_weap_m3a1";
            "rhsgref_30rnd_1143x23_M1911B_SMG";
    MP7: -- zu modern tbh, sonst schön
        "rhsusf_weap_MP7A2";
            "rhsusf_mag_40Rnd_46x30_FMJ";
    PM-63 -- GM!
        "gm_pm63_blk";
            "gm_15Rnd_9x18mm_B_pst_pm63_blk";
    PP-2000 -- zu modern, sonst gut
        "rhs_weap_pp2000";
            "rhs_mag_9x19mm_7n21_20";
    Skorpion Sa vz. 61
        "rhs_weap_savz61";
            "rhsgref_20rnd_765x17_vz61";

Sekundärwaffe:

    Signalpistole:
        "gm_wz78_blk";
            "gm_1Rnd_265mm_smoke_single_blk_gc";
            "gm_1Rnd_265mm_smoke_single_yel_gc";

    Pistole:
        "rhs_weap_makarov_pm";
            "rhs_mag_9x18_8_57N181S";

*/
