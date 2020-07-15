/*  Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/
class MISSION_grievances {
    class does_not_matter {
        file = "USER\functions\grievances";
        class addGrievance {};
        class armyRetaliation {};
        class attackLocation {};
        class isArmyRetaliating {};        
    };
};
class MISSION_win {
    class does_not_matter {
        file = "USER\functions\win";
        class extractPlayers {};
        class hasWon {};
        class isDraw {};
        class isLost {};
        class onPlayerExtracted {};
        class updateFobSheepCount {};
    };
};
