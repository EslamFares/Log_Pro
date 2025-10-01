part of '../log_pro.dart';

String _splitMsg(String text,
    {required int lineLength, required String enter}) {
  List<String> lines = [];
  StringBuffer currentLine = StringBuffer();

  for (String word in text.split(' ')) {
    // Check if adding the word exceeds the max line length
    if ((currentLine.length + word.length + 1) > (lineLength)) {
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
