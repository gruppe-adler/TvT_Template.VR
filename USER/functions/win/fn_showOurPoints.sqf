#include "component.hpp"

private _showOurPoints = {
	switch (side player) do {
		case west: {
			[
				[([WEST] call grad_points_fnc_getPointsCategorized),[],{_x select 1},"DESCEND"] call BIS_fnc_sortBy
			] call grad_points_fnc_displayPoints;
		};
		case east: {
			[
				[], 
				[([EAST] call grad_points_fnc_getPointsCategorized),[],{_x select 1},"DESCEND"] call BIS_fnc_sortBy
			] call grad_points_fnc_displayPoints;
		};
	};
};

private _action = [QGVAR(showOurPoints), "Show our points", "", _showOurPoints, {true}] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
