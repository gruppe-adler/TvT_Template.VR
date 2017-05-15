#include "component.hpp"

params ["_trigger"];

(triggerArea _trigger) params ["_a","_b"];

_marker = createMarker [format ["sectorMarker_%1",getPos _trigger],getPos _trigger];
_marker setMarkerBrush "DiagGrid";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [_a,_b];

_trigger setVariable ["grad_sectors_sectorMarker",_marker];
