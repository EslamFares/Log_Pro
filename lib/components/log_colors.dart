part of '../log_pro.dart';

//🔵 🟡 ⚪️ 🟣 🟢 🩶 ⚫️ ⚪️
/// color enum to choose color in prt function
enum LogColors {
  /// red 🔴
  red,

  ///redBGWhite ⚪️🔴
  redBGWhite,

  ///grayBGWhite
  grayBGWhite,

  ///greenBGWhite 🩶⚪️
  greenBGWhite,

  ///blue 🔵
  blue,

  /// yellow 🟡
  yellow,

  /// white ⚪️
  white,

  /// green 🟢
  green,

  /// magenta 🟣
  magenta,

  /// whiteBGBlack ⚫️⚪️
  whiteBGBlack,

  /// default
  // defaultColor
}

//!=========================================================================
const String _reset = '\x1B[0m';
const String _red = '\x1B[31m';
const String _redBGWhite = '\x1b[37;41m';
const String _grayBGWhite = '\x1b[37;40m';
const String _greenBGWhite = '\x1b[37;42m';
const String _blue = '\x1B[34m';
const String _yellow = '\x1B[33m';
const String _white = '\x1B[37m';
const String _green = '\x1B[32m';
const String _magenta = '\x1B[35m';
const String _whiteBGBlack = '\x1b[30;47m';
// const String _dafualtColor = "\x1b[32;49m";
//!=========================================================================
bool _isValidAnsiCodes(String text) {
  final RegExp ansiColorRegex = RegExp(r'\x1b\[[0-9;]*m');

  final matches = ansiColorRegex.allMatches(text);
  return matches.isNotEmpty && matches.every((match) => match.group(0) != null);
}

//!=========================================================================
String _getColorFromlogColorEnum(LogColors color) {
  switch (color) {
    case LogColors.red:
      return _red;
    case LogColors.redBGWhite:
      return _redBGWhite;
    case LogColors.grayBGWhite:
      return _grayBGWhite;
    case LogColors.greenBGWhite:
      return _greenBGWhite;
    case LogColors.blue:
      return _blue;
    case LogColors.yellow:
      return _yellow;
    case LogColors.white:
      return _white;
    case LogColors.green:
      return _green;
    case LogColors.magenta:
      return _magenta;
    case LogColors.whiteBGBlack:
      return _whiteBGBlack;
    // case LogColors.defaultColor:
    //   return _dafualtColor;
  }
}
