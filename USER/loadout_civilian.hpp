class civilian {
    class AllUnits {
        uniform[] = {"UK3CB_ADC_C_U_01", "UK3CB_ADC_C_U_01_B", "UK3CB_ADC_C_U_01_C", "UK3CB_ADC_C_U_01_D", "UK3CB_ADC_C_U_01_E", "UK3CB_ADC_C_U_01_F", "UK3CB_ADC_C_U_01_G", "UK3CB_ADC_C_U_01_H", "UK3CB_ADC_C_U_01_I", "UK3CB_ADC_C_U_01_J", "UK3CB_ADC_C_U_01_K"};
        vest = "";
        headgear = "UK3CB_TKC_H_Turban_01_1";

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
