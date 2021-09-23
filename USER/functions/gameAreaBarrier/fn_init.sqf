#include "component.hpp" 

if (!hasInterface) exitWith {};

ISNILS(GVAR(previewSeconds), 0);

[{
	params ["_args", "_handle"];
	_args params [""];

	private _posOffset = (velocity player) vectorMultiply GVAR(previewSeconds);
	private _texturesShown = player getVariable [QGVAR(visibleTextures), []];
	private _nearTextures = nearestObjects [(getPos player) vectorAdd _posOffset, ["UserTexture10m_F"], 100];
	TRACE_2("shown %1, near textures %2", count _texturesShown, count _nearTextures);

	player setVariable [QGVAR(visibleTextures), _nearTextures];

	{
		_x hideObject true;
	} forEach (_texturesShown - _nearTextures);

	{
		_x hideObject false;
	} forEach (_nearTextures - _texturesShown);

}, 1, []] call CBA_fnc_addPerFramehandler;
