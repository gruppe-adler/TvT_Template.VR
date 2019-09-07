#include "component.hpp"

#define LINEWIDTH       50

// DON'T USE DEFAULT VALUES HERE, SEE BELOW
params [["_pointsA",nil],["_pointsB",nil]];

if (isNil "_pointsA") then {
    _pointsA = GVAR(activeSectors) apply {getPos _x};
};

if (isNil "_pointsB") then {
    _pointsB = GVAR(attackerSectors) apply {getPos _x};
};

private _fnc_findNearestPoint = {
    params ["_searchPoint","_lookUpArray"];

    private _minDist = 1e9;
    private _nearestPoint = _lookUpArray select 0;
    {
        _dist = _searchPoint distance2D _x;
        if (_dist < _minDist) then {
            _nearestPoint = _lookUpArray select _forEachIndex;
            _minDist = _dist;
        };
    } forEach _lookUpArray;

    _nearestPoint
};

private _fnc_drawLine = {
    params ["_start","_end","_id"];

    private _dist = _start distance2D _end;
    private _dir = _start getDir _end;
    private _mid = _start getPos [_dist/2,_dir];

    private _mrk = createMarker [format ["%1_%2",QGVAR(borderMarker),_id],_mid];
    _mrk setMarkerShape "RECTANGLE";
    _mrk setMarkerBrush "DiagGrid";
    _mrk setMarkerColor "ColorRed";
    _mrk setMarkerSize [LINEWIDTH,_dist/2];
    _mrk setMarkerDir _dir;

    _mrk
};

private _fnc_getHalfwayPoint = {
    params ["_point1","_point2"];
    _point1 getPos [(_point1 distance2D _point2)/2,_point1 getDir _point2]
};

// delete last round's markers
if (isNil QGVAR(borderMarkers)) then {GVAR(borderMarkers) = []} else {{deleteMarker _x} forEach GVAR(borderMarkers)};

// no complicated logic necessary if only one attacker and defender sector --> exit here
if (count _pointsA <= 1 && count _pointsB <= 1) exitWith {
    private _pointA = _pointsA param [0,[0,0,0]];
    private _pointB = _pointsB param [0,[0,0,0]];

    private _dir = _pointA getDir _pointB;
    private _dist = _pointA distance2D _pointB;
    private _halfwayPoint = _pointA getPos [_dist / 2,_dir];
    private _lineStart = _halfwayPoint getPos [2*_dist,_dir + 90];
    private _lineEnd = _halfwayPoint getPos [2*_dist,_dir - 90];

    private _mrk = [_lineStart,_lineEnd,0] call _fnc_drawLine;
    GVAR(borderMarkers) pushBack _mrk;
};


private _pointsASorted = [_pointsA] call EFUNC(common,sortShortestPath);
private _pointsBSorted = [_pointsB] call EFUNC(common,sortShortestPath);

// check if lines are sorted in opposite direction
private _endLeftA = _pointsASorted param [0,[0,0,0]];
private _endLeftB = _pointsBSorted param [0,[0,0,0]];
private _endRightA = _pointsASorted param [(count _pointsASorted) - 1,[0,0,0]];
private _endRightB = _pointsBSorted param [(count _pointsBSorted) - 1,[0,0,0]];
private _totalDistanceEndpointsConnected = (_endLeftA distance2D _endLeftB) + (_endRightA distance2D _endRightB);
private _totalDistanceEndpointsConnectedReverse = (_endLeftA distance2D _endRightB) + (_endRightA distance2D _endLeftB);

if (_totalDistanceEndpointsConnectedReverse < _totalDistanceEndpointsConnected) then {
    reverse _pointsBSorted;
    _endLeftB = _pointsBSorted param [0,[0,0,0]];
    _endRightB = _pointsBSorted param [(count _pointsBSorted) - 1,[0,0,0]];
};

// connect endpoints manually
private _halfwayPoints = [];
_halfwayPoints pushBack ([_endLeftA,_endLeftB] call _fnc_getHalfwayPoint);

for "_i" from 1 to (((count _pointsASorted) max (count _pointsBSorted)) - 2) do {
    _pointA = _pointsASorted select _i;
    _pointB = [_pointA,_pointsBSorted] call _fnc_findNearestPoint;

    _halfwayPoints pushBack ([_pointA,_pointB] call _fnc_getHalfwayPoint);
};

_halfwayPoints pushBack ([_endRightA,_endRightB] call _fnc_getHalfwayPoint);
private _halfwayPointsSorted = [_halfwayPoints] call EFUNC(common,sortShortestPath);

// connect halfway points
for "_i" from 1 to ((count _halfwayPointsSorted) - 1) do {
    _mrk = [_halfwayPointsSorted select (_i - 1),_halfwayPointsSorted select _i,_i] call _fnc_drawLine;
    GVAR(borderMarkers) pushBack _mrk;
};

// extend line ends
private _endLeft = _halfwayPointsSorted param [0,[0,0,0]];
private _endRight = _halfwayPointsSorted param [(count _halfwayPointsSorted) - 1,[0,0,0]];
private _dirLeft = (_halfwayPointsSorted param [1,[0,0,0]]) getDir _endLeft;
private _dirRight = (_halfwayPointsSorted param [(count _halfwayPointsSorted) - 2,[0,0,0]]) getDir _endRight;
private _endLineLength = 500 max ((_endLeft distance2D _endRight) / 4);

private _mrk = [_endLeft,_endLeft getPos [_endLineLength,_dirLeft],9998] call _fnc_drawLine;
GVAR(borderMarkers) pushBack _mrk;

private _mrk = [_endRight,_endRight getPos [_endLineLength,_dirRight],9999] call _fnc_drawLine;
GVAR(borderMarkers) pushBack _mrk;
