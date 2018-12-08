#include "component.hpp"

GVAR(isLastRound) = true;

["Last Round!","Sides agreed on ceasefire.","cfg\notifications\tridentFriendly_ca"] remoteExec [QFUNC(dynamicText),0,false];
