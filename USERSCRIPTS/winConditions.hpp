/*  Hier werden Siegbedingungen festgelegt
*   Beispiel:
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
*/


class bluforPoints {
    preset = "POINTS";
    presetParams[] = {"WEST",30,180};

    condition = "";
    checkInterval = 0;

    winners[] = {"WEST"};
    winText = "BLUFOR wins by points!";
    winTextParams[] = {};
};

class opforPoints {
    preset = "POINTS";
    presetParams[] = {"EAST",30,180};

    condition = "";
    checkInterval = 0;

    winners[] = {"WEST"};
    winText = "BLUFOR wins by points!";
    winTextParams[] = {};
};
