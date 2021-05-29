["Initialize", [true]] call BIS_fnc_dynamicGroups;

{
	[_x,"Land_BagFence_Long_F",2] call grad_fortifications_fnc_addFort;
	[_x,"Land_BagFence_Short_F",5] call grad_fortifications_fnc_addFort;
	[_x,"Land_BagFence_Corner_F",4] call grad_fortifications_fnc_addFort;
	[_x,"Land_BagFence_Round_F",2] call grad_fortifications_fnc_addFort;
	[_x,"Land_Razorwire_F",4] call grad_fortifications_fnc_addFort;
	[_x,"Land_CzechHedgehog_01_new_F",4] call grad_fortifications_fnc_addFort;		
} forEach [ural_blu, ural_opf];
