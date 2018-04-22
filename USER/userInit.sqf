/*  Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

private _pointsWest = ['PointsWest'] call BIS_fnc_getParamValue;
private _pointsEast = ['PointsEast'] call BIS_fnc_getParamValue;
private _maxExtractWinRatio = ['MaxExtractWinRatio'] call BIS_fnc_getParamValue;

GET_POINTSFOREXTRACT_BLUFOR = {(_pointsWest * _maxExtractWinRatio) / (playersNumber west)};
GET_POINTSFOREXTRACT_OPFOR = {(_pointsEast * _maxExtractWinRatio) / (playersNumber east)};
POINTSFORCAPTURE_OPFOR = _pointsEast / 3;
