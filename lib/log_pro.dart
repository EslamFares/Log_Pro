library log_pro;

import 'dart:developer';

/// A customizable logging utility for Dart applications, allowing for structured
/// and styled logging with various color options and formatting styles.
class LogPro {
  /// Indicates if logging is enabled.
  final bool _isLoggingEnabled;
  final String? _sameTitleForAll;
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
  final int _stackTraceLinesToShow;
  final bool _showDate;
  final bool _showTime;
  final bool _showTimeWithMilliseconds;
  final bool _showTimeWithMicroseconds;
  final bool _showEmojis;

  /// Creates a [LogPro] instance with customizable logging options.
  LogPro({
    bool isLoggingEnabled = true,
    String? sameTitleForAll,
    int lineLength = 100,
    String? lineShape,
    bool msgStartInNewLine = true,
    bool splitMsgToSameLineLength = false,
    bool splitMsgToSameLineLengthAddLeading = true,
    bool addEnterAtFirst = true,
    bool makeTitleSameWidth = false,
    bool simpleBorderOneLine = false,
    bool fullLineTitleAndTime = false,
    bool simpleShapeLog = false,
    bool usePrint = false,
    int stackTraceLinesToShow = 3,
    bool showDate = true,
    bool showTime = true,
    bool showTimeWithMilliseconds = true,
    bool showTimeWithMicroseconds = false,
    bool showEmojis = true,
  })  : _stackTraceLinesToShow = stackTraceLinesToShow,
        _usePrint = usePrint,
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
        _sameTitleForAll = sameTitleForAll,
        _isLoggingEnabled = isLoggingEnabled,
        _showDate = showDate,
        _showTime = showTime,
        _showTimeWithMilliseconds = showTimeWithMilliseconds,
        _showTimeWithMicroseconds = showTimeWithMicroseconds,
        _showEmojis = showEmojis;

  /// Creates a copy of this `LogPro` instance but with the given fields
  /// replaced with the new values.

  LogPro copyWith({
    bool? isLoggingEnabled,
    String? sameTitleForAll,
    int? lineLength,
    String? lineShape,
    bool? msgStartInNewLine,
    bool? splitMsgToSameLineLength,
    bool? splitMsgToSameLineLengthAddLeading,
    bool? addEnterAtFirst,
    bool? makeTitleSameWidth,
    bool? simpleBorderOneLine,
    bool? fullLineTitleAndTime,
    bool? simpleShapeLog,
    bool? usePrint,
    int? stackTraceLinesToShow,
    bool? showDate,
    bool? showTime,
    bool? showTimeWithMilliseconds,
    bool? showTimeWithMicroseconds,
    bool? showEmojis,
  }) {
    return LogPro(
      isLoggingEnabled: isLoggingEnabled ?? _isLoggingEnabled,
      sameTitleForAll: sameTitleForAll ?? _sameTitleForAll,
      lineLength: lineLength ?? _lineLength,
      lineShape: lineShape ?? _lineShape,
      msgStartInNewLine: msgStartInNewLine ?? _msgStartInNewLine,
      splitMsgToSameLineLength:
          splitMsgToSameLineLength ?? _splitMsgToSameLineLength,
      splitMsgToSameLineLengthAddLeading: splitMsgToSameLineLengthAddLeading ??
          _splitMsgToSameLineLengthAddLeading,
      addEnterAtFirst: addEnterAtFirst ?? _addEnterAtFirst,
      makeTitleSameWidth: makeTitleSameWidth ?? _makeTitleSameWidth,
      simpleBorderOneLine: simpleBorderOneLine ?? _simpleBorderOneLine,
      fullLineTitleAndTime: fullLineTitleAndTime ?? _fullLineTitleAndTime,
      simpleShapeLog: simpleShapeLog ?? _simpleShapeLog,
      usePrint: usePrint ?? _usePrint,
      stackTraceLinesToShow: stackTraceLinesToShow ?? _stackTraceLinesToShow,
      showDate: showDate ?? _showDate,
      showTime: showTime ?? _showTime,
      showTimeWithMilliseconds:
          showTimeWithMilliseconds ?? _showTimeWithMilliseconds,
      showTimeWithMicroseconds:
          showTimeWithMicroseconds ?? _showTimeWithMicroseconds,
      showEmojis: showEmojis ?? _showEmojis,
    );
  }

  ///main function to print or log
  void prt(
    String message, {
    required LogColors logColor,
    String? title,
    String? emoji,
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
    StackTrace? stackTrace,
    String? customColorANSI,
    bool? usePrint,
  }) {
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
    String currentTime = _logProTimeFormater(
      customTime: time,
      showDate: _showDate,
      showTime: _showTime,
      withMilliseconds: _showTimeWithMilliseconds,
      withMicroseconds: _showTimeWithMicroseconds,
    );
    String line = _line(
        shape: lineShape, length: lineLength, simple: simpleBorderOneLine);
    String lineEnd = _line(
        shape: lineShape,
        length: lineLength,
        isStart: false,
        simple: simpleBorderOneLine);

    String? logEmoji = _showEmojis
        ? _logTitleSameLength(emoji, makeTitleSameWidth, addBrackets: false)
        : null;
    String logTitle = _logTitleSameLength(
      title,
      makeTitleSameWidth,
    );
    String logSameTitleForAll = _logTitleSameLength(
      _sameTitleForAll,
      makeTitleSameWidth,
    );

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
    String lineDividerLeading = simpleShapeLog ? "" : middleLineLeading;
    String lineDivider = "$enter$lineDividerLeading${'┄' * (_lineLength - 1)}";
    String endLine = '$enter$lineEnd';
    String dot = ":";
    String textCheckTrim(String? text) =>
        text != null && text.trim().isNotEmpty ? "$text " : "";
    String titleEmoji =
        "${textCheckTrim(logEmoji)}${textCheckTrim(logTitle)}${textCheckTrim(logSameTitleForAll)}";
    String titleEmojiTime = "$titleEmoji$currentTime";
    String titleSimple = "$middleLineLeading$titleEmojiTime$dot";
    String titleFull =
        _fullLength(titleSimple, fullLineTitleAndTime, length: lineLength);
    String stackTraceString = stackTrace != null
        ? _formatStackTrace(stackTrace, _stackTraceLinesToShow, enter,
            middleLineLeading, simpleShapeLog, lineDivider)
        : '';

    if (isLoggingEnabled) {
      if (simpleShapeLog) {
        _usePrintHandel(
            '$color$checkcustomColor$titleEmojiTime$dot$message$stackTraceString$_reset',
            usePrint: usePrint);
      } else {
        _usePrintHandel(
            '$color$checkcustomColor$startLine$titleFull$lineDivider$msgInNewLine$stackTraceString$endLine$_reset',
            usePrint: usePrint);
      }
    } //  log('$_red[ERROR]: $message$_reset');
  }

//!=========================================================================
  ///error log [❌ Red 🔴]
  void error(String message,
          {StackTrace? stackTrace,
          String? title = 'ERROR',
          String? emoji = '❌'}) =>
      prt(message,
          logColor: LogColors.red,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  ///e [error] log [⛔ Red 🔴]
  void e(String message,
          {StackTrace? stackTrace,
          String? title, //= 'ERROR',
          String? emoji = '⛔'}) =>
      prt(message,
          logColor: LogColors.red,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// risk log [🚨 white text , Red backgroung ⚪️🔴]
  void risk(String message,
          {StackTrace? stackTrace,
          String? title = 'RISK',
          String? emoji = '🚨'}) =>
      prt(message,
          logColor: LogColors.redBGWhite,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// normal log [👍 Blue 🔵]
  void normal(String message,
          {StackTrace? stackTrace,
          String? title = 'NORMAL',
          String? emoji = '👍'}) =>
      prt(message,
          logColor: LogColors.blue,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// d [debug] log [🐞 Blue 🔵]
  void d(String message,
          {StackTrace? stackTrace,
          String? title, //= 'DEBUG',
          String? emoji = '🐞'}) =>
      prt(message,
          logColor: LogColors.blue,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// warning log [⚠️ yellow 🟡]
  void warning(String message,
          {StackTrace? stackTrace,
          String? title = 'WARNING',
          String? emoji = '⚠️'}) =>
      prt(message,
          logColor: LogColors.yellow,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// w [warning] log [⚠️ yellow 🟡]
  void w(String message,
          {StackTrace? stackTrace,
          String? title, //= 'WARNING',
          String? emoji = '⚠️'}) =>
      prt(message,
          logColor: LogColors.yellow,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// info log [💡 white ⚪️]
  void info(String message,
          {StackTrace? stackTrace,
          String? title = 'INFO',
          String? emoji = '💡'}) =>
      prt(message,
          logColor: LogColors.white,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// f [failed] log [ ☠️ white ⚪️]
  void f(String message,
          {StackTrace? stackTrace,
          String? title, //= 'Failed',
          String? emoji = '☠️'}) =>
      prt(message,
          logColor: LogColors.white,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// magenta log [💜 magenta 🟣]
  void magenta(String message,
          {StackTrace? stackTrace,
          String? title = 'Magenta',
          String? emoji = '💜'}) =>
      prt(message,
          logColor: LogColors.magenta,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// logit log [👀 green 🟢]
  void logit(String message,
          {StackTrace? stackTrace,
          String? title = 'LOGIT',
          String? emoji = '👀'}) =>
      prt(message,
          logColor: LogColors.green,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// Success log [✅ green 🟢]
  void s(String message,
          {StackTrace? stackTrace,
          String? title, //= 'SUCCESS',
          String? emoji = '✅'}) =>
      prt(message,
          logColor: LogColors.green,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// grey log [🩶 gray ]
  void grey(String message,
          {StackTrace? stackTrace,
          String? title = 'GREY',
          String? emoji = '🩶'}) =>
      prt(message,
          logColor: LogColors.grayBGWhite,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// green log [🌱 green 🟢]
  void green(String message,
          {StackTrace? stackTrace,
          String? title = 'GREEN',
          String? emoji = '🌱'}) =>
      prt(message,
          logColor: LogColors.green,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

  /// whiteBlack log [🖨️ black & white ⚫️⚪️]
  void whiteBlack(String message,
          {StackTrace? stackTrace,
          String? title = 'WHITE & BLACK',
          String? emoji = '🖨️'}) =>
      prt(message,
          logColor: LogColors.whiteBGBlack,
          title: title,
          emoji: emoji,
          stackTrace: stackTrace ?? StackTrace.current);

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
      // `print` can truncate long strings, so we split the message into lines
      // or chunks to ensure everything is printed.
      final lines = msg.split('\n');
      for (final line in lines) {
        // ignore: avoid_print
        print(line);
      }
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

  String _formatStackTrace(StackTrace stackTrace, int linesToShow, String enter,
      String leading, bool simpleShapeLog, String lineDivider) {
    if (linesToShow <= 0) return '';

    final traceLines = stackTrace
        .toString()
        .split('\n')
        .where((line) => !line.contains('package:log_pro/'));

    if (traceLines.isEmpty) return '';

    final takeCount =
        linesToShow > traceLines.length ? traceLines.length : linesToShow;

    String leadingUsed = simpleShapeLog ? "" : leading;
    final formattedLines = traceLines
        .take(takeCount)
        .map((line) => '$enter$leadingUsed  $line')
        .join('');

    return '$lineDivider$formattedLines';
  }

  String _logProTimeFormater({
    String? customTime,
    bool showDate = true,
    bool showTime = true,
    bool withMilliseconds = true,
    bool withMicroseconds = false,
  }) {
    if (customTime != null) return "[$customTime]";

    if (!showDate && !showTime) {
      return '';
    }

    final now = DateTime.now(); // Single timestamp for consistency
    final parts = <String>[];

    if (showDate) {
      parts.add(now.toString().substring(0, 10));
    }

    if (showTime) {
      parts.add(now.toString().substring(11, 19));
    }

    // Combine date and time with a space if both are present
    var timeString = parts.join(' ');

    // Add milliseconds/microseconds, with a dot separator if there's already a time/date part.
    if (withMilliseconds || withMicroseconds) {
      final msBuffer = StringBuffer();
      if (withMilliseconds) {
        msBuffer.write(now.millisecond.toString().padLeft(3, '0'));
      }
      if (withMicroseconds) {
        msBuffer.write(now.microsecond.toString().padLeft(3, '0'));
      }
      timeString =
          timeString.isEmpty ? msBuffer.toString() : '$timeString.$msBuffer';
    }

    return '[$timeString]';
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

  String _logTitleSameLength(String? title, bool makeTitleSameWidth,
      {int length = 10, bool addBrackets = true}) {
    if (title == null || title.isEmpty) {
      return '';
    }
    String logTitle = title;
    if (makeTitleSameWidth) {
      if (title.length < length) {
        logTitle = (title + ' ' * (length - title.length));
      }
    }
    String logTitleWithBrackets = addBrackets ? "[$logTitle]" : logTitle;
    return logTitleWithBrackets;
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
