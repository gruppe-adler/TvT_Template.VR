/*  Hier werden Siegbedingungen festgelegt
*
*/

class bluforeliminated {
    preset = "ELIMINATION";
    presetParams[] = {"WEST"};

    condition = "";
    checkInterval = 5;

    winners[] = {"EAST","INDEPENDENT"};
    winText = "BLUFOR eliminated after %1 minutes.<br/>OPFOR wins!";
    winTextParams[] = {"round (CBA_missionTime/60)"};
};

class opforeliminated {
    preset = "ELIMINATION";
    presetParams[] = {"EAST"};

    condition = "";
    checkInterval = 5;

    winners[] = {"WEST","INDEPENDENT"};
    winText = "OPFOR eliminated after %1 minutes.<br/>BLUFOR wins!";
    winTextParams[] = {"round (CBA_missionTime/60)"};
};
