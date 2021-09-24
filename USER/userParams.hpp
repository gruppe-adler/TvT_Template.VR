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

class grievance_theft_sheep {
    title = "Feindschaft durch Schafdiebstahl";
    values[] = {0, 0.001, 0.0025, 0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5};
    default = 0.0025;
};
class grievance_theft_car {
    title = "Feindschaft durch Autodiebstahl";
    values[] = {0, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5};
    default = 0.05;
};
class grievance_theft_car_transit {
    title = "Feindschaft durch Schaftransporterdiebstahl";
    values[] = {0, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5};
    default = 0.025;
};
class grievance_murder {
    title = "Feindschaft durch Mord";
    values[] = {0, 0.05, 0.1, 0.2, 0.4, 0.8};
    default = 0.2;
};
