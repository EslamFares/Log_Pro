part of '../log_pro.dart';

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
