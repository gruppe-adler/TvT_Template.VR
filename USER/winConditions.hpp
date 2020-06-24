class bluforeliminated {
    preset = "ELIMINATION";
    presetParams[] = {"WEST"};

    condition = "";
    checkInterval = 0;

    winners[] = {"EAST","INDEPENDENT"};
    winText = "BLUFOR eliminated after %1 minutes.<br/>OPFOR wins!";
    winTextParams[] = {"round (CBA_missionTime/60)"};
};
class opforeliminated {
    preset = "ELIMINATION";
    presetParams[] = {"EAST"};

    condition = "";
    checkInterval = 0;

    winners[] = {"WEST","INDEPENDENT"};
    winText = "OPFOR eliminated after %1 minutes.<br/>BLUFOR wins!";
    winTextParams[] = {"round (CBA_missionTime/60)"};
};

class sheepWinOpfor {
    preset = "";
    presetParams[] = {};

    condition = "(CBA_missionTime > MISSION_timeout) && ([EAST] call grad_points_fnc_getPoints) > ([WEST] call grad_points_fnc_getPoints)";
    checkInterval = 5;

    winners[] = {"EAST"};
    winText = "OPFOR hat %1 und BLUFOR nur %2 Schafe ergattert.<br/>OPFOR gewinnt.";
    winTextParams[] = {"([EAST] call grad_points_fnc_getPoints)","([WEST] call grad_points_fnc_getPoints)"};
};
class sheepWinBlufor {
    preset = "";
    presetParams[] = {};

    condition = "(CBA_missionTime > MISSION_timeout) && ([WEST] call grad_points_fnc_getPoints) > ([EAST] call grad_points_fnc_getPoints)";
    checkInterval = 5;

    winners[] = {"WEST"};
    winText = "BLUFOR hat %1 und OPFOR nur %2 Schafe ergattert.<br/>BLUFOR gewinnt.";
    winTextParams[] = {"([WEST] call grad_points_fnc_getPoints)","([EAST] call grad_points_fnc_getPoints)"};
};

class sheepDraw {
    preset = "";
    presetParams[] = {};

    condition = "(CBA_missionTime > MISSION_timeout) && ([WEST] call grad_points_fnc_getPoints) == ([EAST] call grad_points_fnc_getPoints)";
    checkInterval = 5;

    winners[] = {};
    winText = "BLUFOR wie auch OPFOR haben %1 Schafe ergattert.";
    winTextParams[] = {"([WEST] call grad_points_fnc_getPoints)"};
};
