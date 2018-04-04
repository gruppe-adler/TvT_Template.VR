#include "component.hpp"

params ["_trigger", "_color"];

(triggerArea _trigger) params ["_a","_b","_angle","_isRectangle"];

_marker = createMarker [format ["sectorMarker_%1",getPos _trigger],getPos _trigger];
_marker setMarkerBrush "Horizontal";
_marker setMarkerColor _color;

_marker setMarkerShape (if (_isRectangle) then {"RECTANGLE"} else {"ELLIPSE"});
_marker setMarkerDir _angle;
_marker setMarkerSize [_a,_b];

_trigger setVariable ["grad_extracts_sectorMarker",_marker];
