part of "../sd_utility.dart";

String _date = "DD";
String _shotDay = "SD";
String _longDay = "LD";

String _month = "MM";
String _shotMonth = "SM";
String _longMonth = "LM";

String _year = "YYYY";
String _shortYear = "SY";

String _time24 = "24HM";
String _timeWithSec24 = "24SHM";
String _time12 = "12HM";
String _timeWithSec12 = "12SHM";

class SdDateTime {
  /// * `MM-DD-YYYY 24HM` = `03-30-2023 14:21`
  /// * `MM-DD-SY 12HM` = `03-30-23 02:23 PM`
  ///
  /// Example DateTime is `2023-03-30 14:14:06.074`
  ///
  /// * `DD` - `Date` - `30`
  /// * `SD` - `Day` - `Thu`
  /// * `LD` - `Day` - `Thursday`
  /// * `MM` - `Month` - `03`
  /// * `SM` - `Month` - `Mar`
  /// * `LM` - `Month` - `March`
  /// * `YYYY` - `Year` - `2023`
  /// * `SY` - `Year` - `23`
  /// * `24HM` - `24 Hr Time` - `14:14`
  /// * `24SHM` - `24 Hr Time with Sec` - `14:14:06`
  /// * `12HM` - `12 Hr Time` - `02:14 PM`
  /// * `12SHM` - `12 Hr Time with Sec` - `02:14:06 PM`
  SdDateTime(String formate) {
    _formate = formate.toUpperCase();

    _hasDate = _formate.contains(_date);
    _hasShotDate = _formate.contains(_shotDay);
    _hasLongDate = _formate.contains(_longDay);

    _hasShotMonth = _formate.contains(_shotMonth);
    _hasLongMonth = _formate.contains(_longMonth);
    _hasMonth = _formate.contains(_month);

    _hasFullYear = _formate.contains(_year);
    _hasShotYear = _formate.contains(_shortYear);

    _has24Hours = _formate.contains(_time24);
    _has24HoursWithSec = _formate.contains(_timeWithSec24);
    _has12Hours = _formate.contains(_time12);
    _has12HoursWithSec = _formate.contains(_timeWithSec12);
  }

  late final String _formate;

  late final bool _hasDate;
  late final bool _hasShotDate;
  late final bool _hasLongDate;

  late final bool _hasMonth;
  late final bool _hasShotMonth;
  late final bool _hasLongMonth;

  late final bool _hasFullYear;
  late final bool _hasShotYear;

  late final bool _has24Hours;
  late final bool _has24HoursWithSec;
  late final bool _has12Hours;
  late final bool _has12HoursWithSec;

  String fromDateTime(DateTime date) {
    String convertedDate = _formate;
    if (_hasDate) convertedDate = convertedDate.replaceAll(_date, _getDoubleDigitString(date.day));
    if (_hasShotDate) convertedDate = convertedDate.replaceAll(_shotDay, _getWeekDay(date.weekday, false));
    if (_hasLongDate) convertedDate = convertedDate.replaceAll(_longDay, _getWeekDay(date.weekday, true));

    if (_hasMonth) convertedDate = convertedDate.replaceAll(_month, _getDoubleDigitString(date.month));
    if (_hasShotMonth) convertedDate = convertedDate.replaceAll(_shotMonth, _getMonth(date.month, false));
    if (_hasLongMonth) convertedDate = convertedDate.replaceAll(_longMonth, _getMonth(date.month, true));

    if (_hasFullYear) convertedDate = convertedDate.replaceAll(_year, date.year.toString());
    if (_hasShotYear) convertedDate = convertedDate.replaceAll(_shortYear, date.year.toString().substring(2));

    if (_has24Hours) convertedDate = convertedDate.replaceAll(_time24, _getTime(date, true, false));
    if (_has24HoursWithSec) convertedDate = convertedDate.replaceAll(_timeWithSec24, _getTime(date, true, true));
    if (_has12Hours) convertedDate = convertedDate.replaceAll(_time12, _getTime(date, false, false));
    if (_has12HoursWithSec) convertedDate = convertedDate.replaceAll(_timeWithSec12, _getTime(date, false, true));

    return convertedDate;
  }

  /// Examples of accepted strings:
  ///
  /// * `"2012-02-27"`
  /// * `"2012-02-27 13:27:00"`
  /// * `"2012-02-27 13:27:00.123456789z"`
  /// * `"2012-02-27 13:27:00,123456789z"`
  /// * `"20120227 13:27:00"`
  /// * `"20120227T132700"`
  /// * `"20120227"`
  /// * `"+20120227"`
  /// * `"2012-02-27T14Z"`
  /// * `"2012-02-27T14+00:00"`
  /// * `"-123450101 00:00:00 Z"`: in the year -12345.
  /// * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
  fromString(String date) {
    try {
      DateTime dt = DateTime.parse(date);
      return fromDateTime(dt);
    } catch (e) {
      throw ArgumentError("Invalid date Formate received $date");
    }
  }

  static String _getDoubleDigitString(int data) {
    if (data.toString().length == 1) {
      return "0$data";
    }
    return data.toString();
  }

  static String _getMonth(int month, [bool isFull = true]) {
    if (isFull) {
      return getMonth(month);
    } else {
      String mnt = getMonth(month);
      return mnt.substring(0, 3);
    }
  }

  static String getMonth(int month) {
    List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    if (month > 12) return "Err";
    return months[month - 1];
  }

  static String _getWeekDay(int day, [bool isFull = false]) {
    if (isFull) {
      return getWeekDay(day);
    } else {
      String wDay = getWeekDay(day);
      return wDay.substring(0, 3);
    }
  }

  static String getWeekDay(int day) {
    List<String> weeks = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
    return weeks[day - 1];
  }

  static String _getTime(DateTime dt, [bool is24hr = false, bool sec = false]) {
    int hours = dt.hour;
    if (is24hr) {
      return "${_getDoubleDigitString(hours)}:${_getDoubleDigitString(dt.minute)}${sec ? ":${_getDoubleDigitString(dt.second)}" : ""}".trim();
    } else {
      bool isAM = !(hours > 12);
      return "${_getDoubleDigitString(hours > 12 ? hours - 12 : hours)}:${_getDoubleDigitString(dt.minute)}${sec ? ":${_getDoubleDigitString(dt.second)}" : ""}${isAM ? " AM" : " PM"}"
          .trim();
    }
  }
}
