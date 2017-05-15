#include "component.hpp"

params ["_side",["_mode","HTML"]];

_mode = toUpper _mode;

private _color = switch (_side) do {
    case (WEST): {
        _return = switch (_mode) do {
            case ("HTML"): {"#FF004C99"};
            case ("RGBA"): {[0,0.3,0.6,1]};
            case ("MARKER"): {"COLORWEST"};
        };
        _return
    };
    case (EAST): {
        _return = switch (_mode) do {
            case ("HTML"): {"#FF800000"};
            case ("RGBA"): {[0.5,0,0,1]};
            case ("MARKER"): {"COLOREAST"};
        };
        _return
    };
    case (INDEPENDENT): {
        _return = switch (_mode) do {
            case ("HTML"): {"#FF008000"};
            case ("RGBA"): {[0,0.5,0,1]};
            case ("MARKER"): {"COLORGUER"};
        };
        _return
    };
    case (CIVILIAN): {
        _return = switch (_mode) do {
            case ("HTML"): {"#FF660080"};
            case ("RGBA"): {[0.4,0,0.5,1]};
            case ("MARKER"): {"COLORCIV"};
        };
        _return
    };
    case (sideUnknown): {
        _return = switch (_mode) do {
            case ("HTML"): {"#FFB29900"};
            case ("RGBA"): {[0.7,0.6,0,1]};
            case ("MARKER"): {"COLORUNKNOWN"};
        };
        _return
    };
};

_color
