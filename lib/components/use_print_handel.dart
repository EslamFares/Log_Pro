part of '../log_pro.dart';

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
