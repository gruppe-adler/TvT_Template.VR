#include "component.hpp"

params [
	"_group",
	"_position"
];

private _unit = _group createUnit ["C_Man_1", _position, [], 0, "NONE"];

_unit addUniform selectRandom ["UK3CB_ADC_C_U_01", "UK3CB_ADC_C_U_01_B", "UK3CB_ADC_C_U_01_C", "UK3CB_ADC_C_U_01_D", "UK3CB_ADC_C_U_01_E", "UK3CB_ADC_C_U_01_F", "UK3CB_ADC_C_U_01_G", "UK3CB_ADC_C_U_01_H", "UK3CB_ADC_C_U_01_I", "UK3CB_ADC_C_U_01_J", "UK3CB_ADC_C_U_01_K"];
_unit addHeadgear "UK3CB_TKC_H_Turban_01_1";
if (random 1 > 0.5) then {
	_unit addWeapon "rhs_weap_m38";
	[_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
	[_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
	[_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
	[_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
	[_unit, "rhsgref_5Rnd_762x54_m38"] call CBA_fnc_addMagazine;
} else {
	_unit addWeapon "rhs_weap_makarov_pm";
	[_unit, "rhs_mag_9x18_8_57N181S"] call CBA_fnc_addMagazine;
	[_unit, "rhs_mag_9x18_8_57N181S"] call CBA_fnc_addMagazine;
	[_unit, "rhs_mag_9x18_8_57N181S"] call CBA_fnc_addMagazine;
};
