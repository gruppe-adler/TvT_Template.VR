#include "component.hpp"

assert(hasInterface);

["mission_news", {
    params ["_type","_side"];
    switch (_type) do {
        case ("army_retaliation"): {
            private _id = switch (_side) do {
                case (east): {"opfSheepFob"};
                case (west): {"bluSheepFob"};
                default { throw "logic error"};
            };
            [_id, "CANCELED", false] call BIS_fnc_taskSetState;
            if (_side == playerSide) then {
                [
                    "grad_notification1",
                    [
                        "army retaliates against us!",
                        "the army hates us so much now that they are starting a retaliation strike against our FOB. We cannot use it to store sheep anymore!"
                    ]
                ] call BIS_fnc_showNotification;
            } else {
                [
                    "grad_notification1",
                    [
                        format["Army retaliates against %1!", _side],
                        format["the army hates %1 now so much that they've started a retaliatory strike against their FOB.", _side]
                    ]
                ] call BIS_fnc_showNotification;
            };
        };
        case ("army_enemy"): {
            if (_side == playerSide) then {
                [
                    "grad_notification1",
                    [
                        "Army hates us!",
                        "The army hates us now. We need to avoid their units."
                    ]
                ] call BIS_fnc_showNotification;
            } else {
                [
                    "grad_notification1",
                    [
                        format["Army hates %1", _side],
                        format["They are considering %1 as enemy faction now.", _side]
                    ]
                ] call BIS_fnc_showNotification;
            };
        };
        case ("civ_enemy"): {
            if (_side == playerSide) then {
                [
                    "grad_notification1",
                    [
                        "Civilians hate us",
                        "They might even attack our FOB"
                    ]
                ] call BIS_fnc_showNotification;
            } else {
                [
                    "grad_notification1",
                    [
                        format["Civilians hate %1", _side],
                        "They might even attack their FOB"
                    ]
                ] call BIS_fnc_showNotification;
            };
        };
    };
}] call CBA_fnc_addEventHandler;

[
    "mission_points",
    {
        params [
            ["_eastPoints", 0, [0]],
            ["_westPoints", 0, [0]]
        ];
        [
            "grad_notification1",
            [
                "POINTS COMPARISON",
                format ["opfor: %1, blufor: %2", _eastPoints, _westPoints]
            ]
        ] call BIS_fnc_showNotification;
    }
] call CBA_fnc_addEventHandler;
