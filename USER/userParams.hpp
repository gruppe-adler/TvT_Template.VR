/*  Hier können eigene Missionsparameter eingebunden werden.
*   Ist in missionConfig >> Params included.
*/

class timeout {
    title = "Spielzeit";
    values[] = {60,600,1800,2700,3600,4500,5400,6300,7200};
    texts[] = {"1m","10min","30min","45min","60min","75min","90min","105min","120min"};
    default = 3600;
};

class overtime {
    title = "evtl. Verlängerung";
    values[] = { 60,    600,    900,   1200,   1800,   2700,   3600};
    texts[] = {"1m","10min","15min","20min","30min","45min","60min"};
    default = 1200;
};
