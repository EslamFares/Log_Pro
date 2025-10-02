part of '../log_pro.dart';

String _drawLine(
    {required String lineShape,
    required int lineLength,
    String? enter,
    required String lineLeading}) {
  String line = lineLeading + lineShape * (lineLength - 1);
  line = line.length > lineLength ? line.substring(0, lineLength) : line;
  return (enter ?? "") + line;
}

String _lineStartEnd(
    {required String? lineShape,
    required String? lineShapeLeadingTop,
    required String? lineShapeLeadingBottom,
    required int lineLength,
    required int maxLeadingLength,
    bool useStyle = true,
    bool isStart = true,
    bool simpleBorderOneLine = true}) {
  //===========
  String startLine = lineShapeLeadingTop ?? (simpleBorderOneLine ? "┌" : "╔");
  startLine = startLine._maxLength(maxLeadingLength);
  String endLine = lineShapeLeadingBottom ?? (simpleBorderOneLine ? "└" : "╚");
  endLine = endLine._maxLength(maxLeadingLength);
  // String middleLine = simple ? "┃" : "║";
  String shapeConst = lineShape ?? (simpleBorderOneLine ? "─" : "═");
  //========================
  String line = shapeConst * (lineLength);
  if (useStyle) {
    line = _drawLine(
        lineShape: line,
        lineLength: lineLength,
        lineLeading: isStart ? startLine : endLine);
    // if (isStart) {
    //   line = startLine + line.substring(1);
    // } else {
    //   line = endLine + line.substring(1);
    // }
  }

  return line;
}

extension _MaxLength on String {
  String _maxLength(int maxLength) {
    return length <= maxLength ? this : substring(0, maxLength);
  }
}
