#include "component.hpp"

GVAR(isLastRound) = true;

INFO("Last round has been activated by admin.");
["Last Round!","Sides agreed on ceasefire.","cfg\notifications\tridentFriendly_ca"] remoteExec [QFUNC(dynamicText),0,false];
