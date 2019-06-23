#include "component.hpp"

// returns array in format for weatherArray entry (fn_startLinearSD)

private _return = [overcast,fogParams,wind];
(_return select 2) set [2,false];

_return
