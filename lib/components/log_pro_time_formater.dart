part of '../log_pro.dart';

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
