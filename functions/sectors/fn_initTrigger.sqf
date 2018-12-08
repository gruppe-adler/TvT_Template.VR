#include "component.hpp"

params ["_trigger","_sectorName","_pointsForCapture","_pointsPerSecond","_lockAfterCapture","_captureSides","_owner","_notifyTakingControl","_onSectorCaptured","_sectorData","_captureMode"];


_trigger setTriggerActivation ["ANY", "PRESENT", true];

_trigger setVariable [QGVAR(currentOwner),_owner];
_trigger setVariable [QGVAR(previousOwner),_owner];
_trigger setVariable [QGVAR(sectorName),_sectorName,true];
_trigger setVariable [QGVAR(pointsForCapture),_pointsForCapture];
_trigger setVariable [QGVAR(pointsPerSecond),_pointsPerSecond];
_trigger setVariable [QGVAR(lockAfterCapture),_lockAfterCapture];
_trigger setVariable [QGVAR(captureSides),_captureSides];
_trigger setVariable [QGVAR(sideStrengths),_captureSides apply {0}];
_trigger setVariable [QGVAR(notifyTakingControl),_notifyTakingControl];
_trigger setVariable [QGVAR(onSectorCaptured),_onSectorCaptured];
_trigger setVariable [QGVAR(sectorData),_sectorData];
_trigger setVariable [QGVAR(captureMode),_captureMode];
