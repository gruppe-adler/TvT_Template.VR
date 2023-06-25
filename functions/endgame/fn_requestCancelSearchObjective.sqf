#include "component.hpp"

params [["_objective",objNull],["_caller",objNull]];

if (_caller isEqualTo (_objective getVariable [QGVAR(searchingPlayer),objNull])) then {
    _objective setVariable [QGVAR(searchingPlayer),objNull,true];
};
