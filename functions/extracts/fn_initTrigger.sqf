#include "component.hpp"

params ["_trigger", "_sectorName", "_pointsForExtract", "_extractSides"];

_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements ["this", "[thisTrigger, thisList] call grad_extracts_fnc_onTriggered;", "hint 'trigger off'"];
_trigger setVariable ["grad_extracts_sectorName", _sectorName];
_trigger setVariable ["grad_extracts_pointsForExtract", _pointsForExtract];
_trigger setVariable ["grad_extracts_extractSides", _extractSides];