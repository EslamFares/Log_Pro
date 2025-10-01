part of '../log_pro.dart';

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
