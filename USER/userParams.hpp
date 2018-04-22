/*  Hier können eigene Missionsparameter eingebunden werden.
*   Ist in missionConfig >> Params included.
*/

class PointsWest {
  title = "Points needed to win for BLUFOR";
  values[] = {1050, 4000, 7000, 10800, 15000, 27000};
  default = 10800;
};

class PointsEast {
  title = "Points needed to win for OPFOR";
  values[] = {1050, 4000, 7000, 10800, 15000, 27000};
  default = 10800;
};

class MaxExtractWinRatio {
  title = "Ratio of necessary win points that can be obtained by extracting";
  values[] = {0.1, 0.25, 0.34, 0.5, 0.66};
  default = 0.50;
};
