/*  Hier wird definiert, wieviele Punkt ein Team für welches Ereignis bekommt.
*   Alle oben aufgeführten Ereignisse können zusätzlich in den Klassen der drei Seiten definiert werden, und überschreiben dann den Standardwert für diese Seite.
*
*   Beispiel:
*   OPFOR und INDEPENDENT bekommen 2 Punkte pro ausgeschaltetem Zivilisten, BLUFOR bekommt -5 Punkte.
*
    civKilled = 2;
    class BLUFOR {
        civKilled = -5;
    };
*
*/

playerKilled = 0;
aiKilled = 0;
civKilled = 0;

class BLUFOR {

};

class OPFOR {

};

class INDEPENDENT {

};
