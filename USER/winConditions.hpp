class opforWins {
    preset = "";
    presetParams[] = {};

    condition = "[east] call mission_win_fnc_hasWon";
    checkInterval = 5;

    winners[] = {"EAST"};
    winText = "OPFOR hat %1 und BLUFOR nur %2 Schafe ergattert.<br/>OPFOR gewinnt.";
    winTextParams[] = {"([EAST] call grad_points_fnc_getPoints)","([WEST] call grad_points_fnc_getPoints)"};
};
class bluforWins {
    preset = "";
    presetParams[] = {};

    condition = "[west] call mission_win_fnc_hasWon";
    checkInterval = 5;

    winners[] = {"WEST"};
    winText = "BLUFOR hat %1 und OPFOR nur %2 Schafe ergattert.<br/>BLUFOR gewinnt.";
    winTextParams[] = {"([WEST] call grad_points_fnc_getPoints)","([EAST] call grad_points_fnc_getPoints)"};
};

class isDraw {
    preset = "";
    presetParams[] = {};

    condition = "[] call mission_win_fnc_isDraw";
    checkInterval = 5;

    winners[] = {"EAST", "WEST"};
    winText = "BLUFOR wie auch OPFOR haben %1 Schafe ergattert.";
    winTextParams[] = {"([WEST] call grad_points_fnc_getPoints)"};
};

class playersLost {
    preset = "";
    presetParams[] = {};

    condition = "[] call mission_win_fnc_isLost";
    checkInterval = 5;

    winners[] = {"CIVILIAN"};
    winText = "BLUFOR wie auch OPFOR sind eliminiert worden";
    winTextParams[] = {};
};
