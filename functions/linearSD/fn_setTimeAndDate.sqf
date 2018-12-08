/* Sets date and time.
*  Example array passed by user:
*  _dateAndTimeArray = [
    [19,30],
    [27,7,20],
    [28,3,0],
    [28,12,10],
    [29,5,35],
    [30,15,22],
    [5,1,4,22],
    [2,17,58]
  ];
*/

#include "component.hpp"

if (!isServer) exitWith {};

private _targetDateAndTime = GVAR(dateAndTimeArray) deleteAt 0;
if (isNil "_targetDateAndTime") exitWith {};

private _dateAndTime = date;
_dateAndTime params ["_curYear","_curMonth","_curDay","_curHour","_curMinute"];

reverse _targetDateAndTime;
_targetDateAndTime params [["_targetMinute",_curMinute],["_targetHour",_curHour],["_targetDay",_curDay],["_targetMonth",_curMonth],["_targetYear",_curYear]];
_targetDateAndTime = [_targetYear,_targetMonth,_targetDay,_targetHour,_targetMinute];

private _curDateNumber = dateToNumber _dateAndTime;
private _targetDateNumber = dateToNumber _targetDateAndTime;

if ((_targetYear <= _curYear) && {_curDateNumber > _targetDateNumber}) exitWith {ERROR_1("Date and time for round %1 are in the past!",GVAR(roundNumber))};

if (_targetYear == _curYear) then {
    // 8760 hours in a year (dateToNumber accounts for leap years by increasing range)
    skipTime ((_targetDateNumber - _curDateNumber) * 8760);
} else {
    setDate _targetDateAndTime;
};
