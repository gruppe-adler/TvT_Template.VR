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
class MISSION_gameAreaBarrier {
    class does_not_matter {
        file = "USER\functions\gameAreaBarrier";
        class init { postInit = 1; }; 
        class addGameAreaBarrierFromMarker {}; 
        class addGameAreaBarrierBetweenPoints {};
    };
};

class MISSION_win {
    class does_not_matter {
        file = "USER\functions\win";
        class createPersonalTasks {};
        class createSideTasks {};
        class extractPlayers {};
        class hasWon {};
        class isDraw {};
        class isLost {};
        class onPlayerExtracted {};
        class planPointNotifications {};
        class registerNotifications {};
        class showOurPoints {};
        class updateFobSheepCount {};
    };
};
