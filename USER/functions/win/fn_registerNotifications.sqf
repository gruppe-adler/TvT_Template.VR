
["mission_news", {
   params ["_type","_side"];
   if (_type == "army_retaliation") then {
        private _id = switch (_side) do {
            case (east): {"opfSheepFob"};
            case (west): {"bluSheepFob"};
            default { throw "logic error"};
        };
        [_id, "CANCELED", false] call BIS_fnc_taskSetState;
        if (_side == playerSide) then {
            ["grad_notification1", ["army retaliates against us!", "the army hates us now."]] call BIS_fnc_showNotification;
        } else {
            ["grad_notification1", ["army retaliates against the other side!", "the army hates the others now."]] call BIS_fnc_showNotification;
        };
   };
}] call CBA_fnc_addEventHandler;
