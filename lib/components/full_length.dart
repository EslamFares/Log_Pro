part of '../log_pro.dart';

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
