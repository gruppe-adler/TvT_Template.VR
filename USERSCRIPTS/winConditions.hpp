/*  Hier werden Siegbedingungen festgelegt
*
*/

class bluforeliminated {
    condition = "({side _x == WEST} count playableUnits) == 0";
    checkInterval = 5;
    winners[] = {"EAST","INDEPENDENT"};
    winText = "OPFOR eliminated after %1 minutes.<br/>BLUFOR wins!";
};

class opforeliminated {
    condition = "({side _x == EAST} count playableUnits) == 0";
    checkInterval = 5;
    winners[] = {"WEST","INDEPENDENT"};
    winText = "BLUFOR eliminated after %1 minutes.<br/>OPFOR wins!";
};
