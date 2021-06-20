#include "component.hpp" 

params [
	["_marker", "", [""]], // area marker name
	["_sides", ["N","E","S","W"], [[]]], // which of the four sides of a marker should get a barrier. for an unrotated marker, these would be: N,E,S,W sides
	["_isVisibleFrom", "outside", ["outside", "inside"]]
];

assert((markerShape _marker) isEqualTo "RECTANGLE");
assert((markerDir _marker) isEqualTo 0); // TODO: remove requirement & do all the calculations with setVectorDir

private _centerPos = getMarkerPos _marker;

(markerSize _marker) params [
	["_a2", 0, [0]],
	["_b2", 0, [0]]
];

{
	private _side = _x;

	private _p1 = [0, 0, 0];
	private _p2 = [0, 0, 0];
	switch (_side) do {
		case "N": {
			private _centerOfLine = _centerPos vectorAdd [0, _b2, 0];
			_p1 = _centerOfLine vectorAdd [-_a2, 0, 0];
			_p2 = _centerOfLine vectorAdd [_a2, 0, 0];
		};
		case "E": {
			private _centerOfLine = _centerPos vectorAdd [_a2, 0, 0];
			_p1 = _centerOfLine vectorAdd [0, -_b2, 0];
			_p2 = _centerOfLine vectorAdd [0,  _b2, 0];
		};
		case "S": {
			private _centerOfLine = _centerPos vectorAdd [0, -_b2, 0];
			_p1 = _centerOfLine vectorAdd [ _a2, 0, 0];
			_p2 = _centerOfLine vectorAdd [-_a2, 0, 0];
		};
		case "W": {
			private _centerOfLine = _centerPos vectorAdd [-_a2, 0, 0];
			_p1 = _centerOfLine vectorAdd [0, -_b2, 0];
			_p2 = _centerOfLine vectorAdd [0, _b2, 0];
		};
		default { ERROR_1("")};
	};

	[
		_p1, 
		_p2, 
		if (_isVisibleFrom isEqualTo "inside") then {"right"} else {"left"}
	] call FUNC(addGameAreaBarrierBetweenPoints);
	

} forEach _sides;