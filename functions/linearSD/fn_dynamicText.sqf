#include "component.hpp"

params [["_line1",""],["_line2",""],["_messagePic","seize_ca"]];

private _messagePic = format ["\a3\ui_f\data\gui\%1.paa",_messagePic];

private _compiledLines = _line1;
if (_line2 != "") then {
    _compiledLines = _compiledLines + "<br/>" + _line2;
};

private _messageText = format ["<img size= '1' style='vertical-align:middle' shadow='false' image='%1'/><br/><t size='.9' color='#FFFFFF'>%2</t>",_messagePic,_compiledLines];
private _yCoord = safeZoneY + (safeZoneH * 0.4);
[_messageText,0,_yCoord,4,2] spawn BIS_fnc_dynamicText;
