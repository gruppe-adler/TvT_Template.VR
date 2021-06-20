#include "component.hpp" 

params [
	["_a", [0, 0, 0], [[]]],
	["_b", [0, 0, 0], [[]]]
];

private _posNW = getMarkerPos "mrk_barrier_nw";
private _posNE = getMarkerPos "mrk_barrier_ne";
private _posSE = getMarkerPos "mrk_barrier_se";
private _posSW = getMarkerPos "mrk_barrier_sw";

private _textures = [];

_posNW params ["_posNW_x", "_posNW_y", "_posNW_z"];
private _distance = _posNW distance2D _posNE;

for "_i" from 0 to (_distance/10) do {
    private _texture = "UserTexture10m_F" createVehicleLocal [0,0,0];
    _texture setPosASL [_posNW_x + _i * 10, _posNW_y, 80];
    _texture setVectorUp [0,0,1];
    _texture setObjectTexture [0, "data\barrier.paa"];
    _texture hideObject true;

    _textures pushBack _texture;
};

_posNE params ["_posNE_x", "_posNE_y", "_posNE_z"];
_distance = _posNE distance2D _posSE;

for "_i" from 0 to (_distance/10) do {
    private _texture = "UserTexture10m_F" createVehicleLocal [0,0,0];
    _texture setPosASL [_posNE_x, _posNE_y - _i * 10, 80];
    _texture setVectorUp [0,0,1];
    _texture setObjectTexture [0, "data\barrier.paa"];
    _texture hideObject true;
    _texture setDir 90;

    _textures pushBack _texture;
};


_posSE params ["_posSE_x", "_posSE_y", "_posSE_z"];
_distance = _posSE distance2D _posSW;

for "_i" from 0 to (_distance/10) do {
    private _texture = "UserTexture10m_F" createVehicleLocal [0,0,0];
    _texture setPosASL [_posSE_x - _i * 10, _posSE_y, 90];
    _texture setVectorUp [0,0,1];
    _texture setObjectTexture [0, "data\barrier.paa"];
    _texture hideObject true;
    _texture setDir 180;

    _textures pushBack _texture;
};

player setVariable ["IC_setup_textures", _textures];

/*
private _triggerNorth = triggerArea trg_barrier_north;
private _triggerEast = triggerArea trg_barrier_north;
private _triggerNorth = triggerArea trg_barrier_north;
*/

[{
    params ["_args", "_handle"];
    _args params [""];

    [] call IC_setup_fnc_hideBarrier;
    [] call IC_setup_fnc_showBarrier;

    if (player inArea trg_barrier_north || 
        player inArea trg_barrier_east || 
        player inArea trg_barrier_south) then {

        hint "Du warst außerhalb des Spielfelds.";

        player setDamage 1; 
    };

}, 2, []] call CBA_fnc_addPerFramehandler;