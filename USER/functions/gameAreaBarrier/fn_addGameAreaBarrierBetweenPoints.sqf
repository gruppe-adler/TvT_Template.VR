#include "component.hpp" 

// [[0, 0, 0], [8000, 0, 0]] call mission_gameAreaBarrier_fnc_addGameAreaBarrierBetweenPoints;

params [
	["_a", [0, 0, 0], [[]]],
	["_b", [0, 0, 0], [[]]],
	["_isVisibleFrom", "right", ["right", "left"]],
	["_heightASL", 0, [0]] // optional: will follow terrain curve if not set
];

private _textures = player getVariable [QGVAR(textures), []];

private _distance = _a distance2D _b;
private _textureCount = (_distance/10) max 1;
private _startX = _a#0;
private _startY = _a#1;
private _abDiff = _b vectorDiff _a;
private _diffX = _abDiff#0;
private _diffY = _abDiff#1;

private _vectorDir = if (_isVisibleFrom isEqualTo "left") then {[0,0,1] vectorCrossProduct (_abDiff vectorMultiply -1)} else {[0,0,1] vectorCrossProduct _abDiff};

INFO_7("_distance %1 _startX %2 _startY %3 _diffX %4 _diffY %5 _textureCount %6 _vectorDir %7", _distance, _startX, _startY, _diffX, _diffY, _textureCount, _vectorDir);

for "_i" from 0 to _textureCount do {
    private _texture = "UserTexture10m_F" createVehicleLocal [0,0,0];
	private _targetPos = [
		_startX + _i * (_diffX / _textureCount), 
		_startY + _i * (_diffY / _textureCount), 
		_heightASL
	];
	if (_heightASL isEqualTo 0) then {
		_texture setPos _targetPos;	
	} else {
		_texture setPosASL _targetPos;	
	};
    _texture setPos _targetPos;
    _texture setVectorDirAndUp [_vectorDir, if (_heightASL isEqualTo 0) then {surfaceNormal _targetPos} else {[0,0,1]}];
    _texture setObjectTexture [0, "data\barrier2.paa"];
    _texture hideObject true;

    _textures pushBack _texture;
};

player setVariable [QGVAR(textures), _textures];
