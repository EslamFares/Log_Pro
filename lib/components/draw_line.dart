part of '../log_pro.dart';

String _line(
    {String? shape,
    required int length,
    bool useStyle = true,
    bool isStart = true,
    bool simple = true}) {
  //===========
  String startLine = simple ? "┌" : "╔";
  String endLine = simple ? "└" : "╚";
  // String middleLine = simple ? "┃" : "║";
  String shapeConst = simple ? "─" : "═";
  //========================

  String line = (shape ?? shapeConst) * (length);
  if (useStyle) {
    if (isStart) {
      line = startLine + line.substring(1);
    } else {
      line = endLine + line.substring(1);
    }
  }

  return line;
}
