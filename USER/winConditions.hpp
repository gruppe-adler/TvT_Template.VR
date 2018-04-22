class bluforeliminated {
    preset = "ELIMINATION";
    presetParams[] = {"WEST"};

    condition = "";
    checkInterval = 2;

    winners[] = {"EAST"};
    winText = "BLUFOR eliminated after %1 minutes.<br/>OPFOR wins!";
    winTextParams[] = {"round (CBA_missionTime/60)"};
};
class opforeliminated {
    preset = "ELIMINATION";
    presetParams[] = {"EAST"};

    condition = "";
    checkInterval = 2;

    winners[] = {"WEST"};
    winText = "OPFOR eliminated after %1 minutes.<br/>BLUFOR wins!";
    winTextParams[] = {"round (CBA_missionTime/60)"};
};

class bluforWinPoints {
    preset = "POINTS";
    presetParams[] = {"WEST", "['PointsWest'] call BIS_fnc_getParamValue"};

    condition = "";
    checkInterval = 1;

    winners[] = {"WEST"};
    winText = "BLUFOR wins by points!<br/>OPFOR only had %1 points.";
    winTextParams[] = {"[EAST] call grad_common_fnc_getPoints"};
};

class opforWinPoints {
    preset = "POINTS";
    presetParams[] = {"EAST", "['PointsEast'] call BIS_fnc_getParamValue"};

    condition = "";
    checkInterval = 1;

    winners[] = {"EAST"};
    winText = "EAST wins by points!<br/>BLUFOR only had %1 points.";
    winTextParams[] = {"[WEST] call grad_common_fnc_getPoints"};
};
