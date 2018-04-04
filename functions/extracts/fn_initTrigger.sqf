#include "component.hpp"

params ["_trigger","_sectorName","_pointsForCapture","_pointsPerSecond","_lockAfterCapture","_captureSides","_owner"];


_trigger setTriggerActivation ["ANY", "PRESENT", true];

_trigger setVariable ["grad_sectors_currentOwner",_owner];
_trigger setVariable ["grad_sectors_previousOwner",_owner];
_trigger setVariable ["grad_sectors_sectorName",_sectorName];
_trigger setVariable ["grad_sectors_pointsForCapture",_pointsForCapture];
_trigger setVariable ["grad_sectors_pointsPerSecond",_pointsPerSecond];
_trigger setVariable ["grad_sectors_lockAfterCapture",_lockAfterCapture];
_trigger setVariable ["grad_sectors_captureSides",_captureSides];
_trigger setVariable ["grad_sectors_sideStrenghts",[0,0,0]];
