library log_pro;

import 'dart:developer';

/// A customizable logging utility for Dart applications, allowing for structured
/// and styled logging with various color options and formatting styles.
class LogPro {
  /// Indicates if logging is enabled.
  final bool _isLoggingEnabled;
  final String _title;
  final int _lineLength;
  final String? _lineShape;
  final bool _msgStartInNewLine;
  final bool _splitMsgToSameLineLength;
  final bool _splitMsgToSameLineLengthAddLeading;
  final bool _addEnterAtFirst;
  final bool _makeTitleSameWidth;
  final bool _simpleBorderOneLine;
  final bool _fullLineTitleAndTime;
  final bool _simpleShapeLog;
  final bool _usePrint;

  /// Creates a [LogPro] instance with customizable logging options.
  LogPro({
    bool isLoggingEnabled = true,
    String title = "Logpro",
    int lineLength = 85,
    String? lineShape,
    bool msgStartInNewLine = true,
    bool splitMsgToSameLineLength = true,
    bool splitMsgToSameLineLengthAddLeading = true,
    bool addEnterAtFirst = true,
    bool makeTitleSameWidth = false,
    bool simpleBorderOneLine = false,
    bool fullLineTitleAndTime = false,
    bool simpleShapeLog = false,
    bool usePrint = false,
  })  : _usePrint = usePrint,
        _simpleShapeLog = simpleShapeLog,
        _fullLineTitleAndTime = fullLineTitleAndTime,
        _simpleBorderOneLine = simpleBorderOneLine,
        _makeTitleSameWidth = makeTitleSameWidth,
        _addEnterAtFirst = addEnterAtFirst,
        _splitMsgToSameLineLengthAddLeading =
            splitMsgToSameLineLengthAddLeading,
        _splitMsgToSameLineLength = splitMsgToSameLineLength,
        _msgStartInNewLine = msgStartInNewLine,
        _lineShape = lineShape,
        _lineLength = lineLength,
        _title = title,
        _isLoggingEnabled = isLoggingEnabled;

  ///main function to print or log
  void prt(
    String message, {
    required LogColors logColor,
    String? title,
    String? lineShape,
    int? lineLength,
    String? time,
    bool? msgStartInNewLine,
    bool? makeTitleSameWidth,
    bool? simpleBorderOneLine,
    bool? fullLineTitleAndTime,
    bool? splitMsgToSameLineLength,
    bool? splitMsgToSameLineLengthAddLeading,
    bool? simpleShapeLog,
    bool? addEnterAtFirst,
    String? customColorANSI,
    bool? usePrint,
  }) {
    title = title ?? _title;
    lineShape = lineShape ?? _lineShape;
    lineLength = lineLength ?? _lineLength;
    msgStartInNewLine = msgStartInNewLine ?? _msgStartInNewLine;
    makeTitleSameWidth = makeTitleSameWidth ?? _makeTitleSameWidth;
    simpleBorderOneLine = simpleBorderOneLine ?? _simpleBorderOneLine;
    fullLineTitleAndTime = fullLineTitleAndTime ?? _fullLineTitleAndTime;
    splitMsgToSameLineLength =
        splitMsgToSameLineLength ?? _splitMsgToSameLineLength;
    splitMsgToSameLineLengthAddLeading = splitMsgToSameLineLengthAddLeading ??
        _splitMsgToSameLineLengthAddLeading;
    simpleShapeLog = simpleShapeLog ?? _simpleShapeLog;
    addEnterAtFirst = addEnterAtFirst ?? _addEnterAtFirst;
    lineShape = lineShape ?? _lineShape;
    usePrint = usePrint ?? _usePrint;
    bool customColorCorrectFormate =
        customColorANSI != null ? _isValidAnsiCodes(customColorANSI) : false;
    String color = customColorANSI != null
        ? customColorCorrectFormate
            ? customColorANSI
            : _yellow
        : _getColorFromlogColorEnum(logColor);

    String enter = '$_reset\n$color';
    String checkcustomColor = customColorANSI != null
        ? customColorCorrectFormate
            ? ""
            : "your custom color is not correct format ex: (\\x1B[31m) "
        : "";
    String middleLineLeading = simpleBorderOneLine ? "|" : "║";
    message = message.replaceAll("\n", enter + middleLineLeading);
    //============================================================
    bool isLoggingEnabled = _isLoggingEnabled;
    //============================================================
    String currentTime = _logProTimeFormater(customTime: time);
    String line = _line(
        shape: lineShape, length: lineLength, simple: simpleBorderOneLine);
    String lineEnd = _line(
        shape: lineShape,
        length: lineLength,
        isStart: false,
        simple: simpleBorderOneLine);

    String logTitle = _logTitleSameLength(title, makeTitleSameWidth);

    String messageLog = splitMsgToSameLineLength
        ? _splitMsg(message,
            lineLength: lineLength,
            enter: splitMsgToSameLineLengthAddLeading
                ? enter + middleLineLeading
                : enter)
        : message;
    String msgInNewLine = msgStartInNewLine
        ? ('$enter$middleLineLeading$messageLog')
        : messageLog;
    String startLine = addEnterAtFirst ? '$enter$line$enter' : '$line$enter';
    String endLine = '$enter$lineEnd';
    String dot = ":";
    String titleSimple = "$middleLineLeading$logTitle$currentTime$dot";
    String titleFull =
        _fullLength(titleSimple, fullLineTitleAndTime, length: lineLength);

    if (isLoggingEnabled) {
      if (simpleShapeLog) {
        _usePrintHandel('$color$checkcustomColor$logTitle$dot$message$_reset',
            usePrint: usePrint);
      } else {
        _usePrintHandel(
            '$color$checkcustomColor$startLine$titleFull$msgInNewLine$endLine$_reset',
            usePrint: usePrint);
      }
    } //  log('$_red[ERROR]: $message$_reset');
  }

//!=========================================================================
  ///error log function red color
  void error(String message) =>
      prt(message, logColor: LogColors.red, title: 'ERROR');

  /// risk log function
  void risk(String message, {bool simple = false}) =>
      prt(message, logColor: LogColors.redBGWhite, title: 'RISK');

  /// normal log function
  void normal(String message) =>
      prt(message, logColor: LogColors.blue, title: 'NORMAL');

  /// warning log function
  void warning(String message) =>
      prt(message, logColor: LogColors.yellow, title: 'WARNING');

  /// info log function
  void info(String message) =>
      prt(message, logColor: LogColors.white, title: 'INFO');

  /// magenta log function
  void magenta(String message) =>
      prt(message, logColor: LogColors.magenta, title: 'Magenta');

  /// logit log function
  void logit(String message) => prt(message, logColor: LogColors.green);

  /// grey log function
  void grey(String message) => prt(message, logColor: LogColors.grayBGWhite);

  /// green log function
  void green(String message) => prt(message, logColor: LogColors.green);

  /// whiteBlack log function
  void whiteBlack(String message) =>
      prt(message, logColor: LogColors.whiteBGBlack);

//!=========================================================================
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _redBGWhite = '\x1b[37;41m';
  static const String _grayBGWhite = '\x1b[37;40m';
  static const String _greenBGWhite = '\x1b[37;42m';
  static const String _blue = '\x1B[34m';
  static const String _yellow = '\x1B[33m';
  static const String _white = '\x1B[37m';
  static const String _green = '\x1B[32m';
  static const String _magenta = '\x1B[35m';
  static const String _whiteBGBlack = '\x1b[30;47m';
  static const String _dafualtColor = "\x1b[32;49m";
//!=========================================================================
  void _usePrintHandel(String msg, {required bool usePrint}) {
    if (usePrint) {
      // ignore: avoid_print
      print(msg);
    } else {
      log(msg);
    }
  }

  String _splitMsg(String text, {int? lineLength, required String enter}) {
    List<String> lines = [];
    StringBuffer currentLine = StringBuffer();

    for (String word in text.split(' ')) {
      // Check if adding the word exceeds the max line length
      if ((currentLine.length + word.length + 1) >
          (lineLength ?? _lineLength)) {
        // Add the current line to the lines list
        lines.add(currentLine.toString().trim());
        // Start a new line
        currentLine.clear();
      }

      // Add the word to the current line
      currentLine.write('$word ');
    }

    // Add the last line if there's any remaining text
    if (currentLine.isNotEmpty) {
      lines.add(currentLine.toString().trim());
    }

    // Join the lines with a newline character
    return lines.join(enter);
  }

  String _fullLength(String text, bool makeTitleSameWidth,
      {int length = 10, String trailShape = " ", String speace = " "}) {
    String textLog = text;
    if (makeTitleSameWidth) {
      if (text.length < length) {
        textLog = (text + speace * (length - text.length - 1) + trailShape);
      }
    }
    return textLog;
  }

  String _logProTimeFormater(
      {bool fullTime = false,
      bool timeOnly = true,
      bool onlyDate = false,
      String? customTime,
      bool withMilliseconds = true,
      bool withMicroSeconds = false}) {
    String time = DateTime.now().toString();
    if (customTime != null) return "[$customTime]";
    if (onlyDate) {
      time = time.substring(0, 10);
    } else if (timeOnly) {
      time = time.substring(11, 19);
      if (withMilliseconds) {
        time += '.${DateTime.now().millisecond.toString().padLeft(3, '0')}';
        if (withMicroSeconds) {
          time += '.${DateTime.now().microsecond.toString().padLeft(3, '0')}';
        }
      }
    } else if (fullTime) {
      time = time.substring(0, 19);
      if (withMilliseconds) {
        time += '.${DateTime.now().millisecond.toString().padLeft(3, '0')}';
        if (withMicroSeconds) {
          time += '.${DateTime.now().microsecond.toString().padLeft(3, '0')}';
        }
      }
    }
    return "[$time]";
  }

  String _line(
      {String? shape,
      int? length,
      bool useStyle = true,
      bool isStart = true,
      bool simple = true}) {
    //===========
    String startLine = simple ? "┌" : "╔";
    String endLine = simple ? "└" : "╚";
    // String middleLine = simple ? "┃" : "║";
    String shapeConst = simple ? "─" : "═";
    //========================

    String line = (shape ?? shapeConst) * (length ?? _lineLength);
    if (useStyle) {
      if (isStart) {
        line = startLine + line.substring(1);
      } else {
        line = endLine + line.substring(1);
      }
    }

    return line;
  }

  String _logTitleSameLength(String title, bool makeTitleSameWidth,
      {int length = 10}) {
    String logTitle = title;
    if (makeTitleSameWidth) {
      if (title.length < length) {
        logTitle = (title + ' ' * (length - title.length));
      }
    }
    return "[$logTitle]";
  }

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
      case LogColors.defaultColor:
        return _dafualtColor;
    }
  }

  bool _isValidAnsiCodes(String text) {
    final RegExp ansiColorRegex = RegExp(r'\x1b\[[0-9;]*m');

    final matches = ansiColorRegex.allMatches(text);
    return matches.isNotEmpty &&
        matches.every((match) => match.group(0) != null);
  }
}

/// color enum to choose color in prt function
enum LogColors {
  /// red
  red,

  ///redBGWhite
  redBGWhite,

  ///grayBGWhite
  grayBGWhite,

  ///greenBGWhite
  greenBGWhite,

  ///blue
  blue,

  /// yellow
  yellow,

  /// white
  white,

  /// green
  green,

  /// magenta
  magenta,

  /// whiteBGBlack
  whiteBGBlack,

  /// default
  defaultColor
}
