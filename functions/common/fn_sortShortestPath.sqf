// sorts array of points to form the shortest continuous path

params ["_points"];

private _fnc_shortestPath = {
    params ["_searchPoint","_remainingShortestPathPoints"];

    private _path = [_searchPoint];

    while {count _remainingShortestPathPoints > 0} do {
        _minDist = 1e9;
        _shortestDistanceID = 0;
        {
            _dist = _searchPoint distance2D _x;
            if (_dist < _minDist) then {
                _minDist = _dist;
                _shortestDistanceID = _forEachIndex;
            };
        } forEach _remainingShortestPathPoints;

        _searchPoint = _remainingShortestPathPoints deleteAt _shortestDistanceID;
        _path pushBack _searchPoint;
    };

    _path
};

private _fnc_getPathDistance = {
    params ["_path"];

    private _totalDistance = 0;
    for "_i" from 1 to ((count _path)-1) do {
        _totalDistance = _totalDistance + ((_path select (_i - 1)) distance2D (_path select _i));
    };

    _totalDistance
};

private _distancesAndPaths = [];
{
    _remainingPoints = +_points;
    _startPoint = _remainingPoints deleteAt _forEachIndex;
    _path = [_startPoint,_remainingPoints] call _fnc_shortestPath;
    _pathDistance = [_path] call _fnc_getPathDistance;
    _distancesAndPaths pushBack [_pathDistance,_path];
} forEach _points;

private _shortestDist = 1e9;
private _returnPath = [];
{
    _x params ["_dist","_path"];
    if (_dist < _shortestDist) then {
        _shortestDist = _dist;
        _returnPath = _path;
    };
} forEach _distancesAndPaths;


_returnPath
