class civilian {
    class AllUnits {
        uniform[] = {"LOP_U_TAK_Civ_Fatigue_01", "LOP_U_TAK_Civ_Fatigue_02", "LOP_U_TAK_Civ_Fatigue_06", "LOP_U_TAK_Civ_Fatigue_08", "LOP_U_TAK_Civ_Fatigue_10", "LOP_U_TAK_Civ_Fatigue_11", "LOP_U_TAK_Civ_Fatigue_14"}; // capacity = 100
        vest = "";
        headgear = "LOP_H_Turban";

        // 10% get a rifle, 20% get a handgun

        primaryWeapon[] = {"rhs_weap_m38", "", "", "", "", "", "", "", "", ""};
        primaryWeaponMagazine = "rhsgref_5Rnd_762x54_m38";

        secondaryWeapon[] = {"rhs_weap_makarov_pm", "", "", "", ""};
        secondaryWeaponMagazine = "rhs_mag_9x18_8_57N181S";

        addItemsToUniform[] = {
            LIST_3("rhs_mag_9x18_8_57N181S"),
            LIST_3("rhsgref_5Rnd_762x54_m38")
        };
    };
};
