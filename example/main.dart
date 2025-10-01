import 'package:log_pro/log_pro.dart';

void main() async {
  // Create a LogPro instance
  final logPro = LogPro(
    // sameTitleForAll: "LogPro",
    simpleBorderOneLine: true,
    //
  );
  final logPro2 = logPro.copyWith(
      // sameTitleForAll: "LogPro2",
      isLoggingEnabled: true,
      stackTraceLinesToShow: 0);

  //stop log
  // final logPro = LogPro(isLoggingEnabled: false);

  //use print
  final ptr = LogPro(
    sameTitleForAll: "LogPro Print",
    usePrint: true,
    isLoggingEnabled: true,
  );

  // Example log messages
  logPro.w("message");
  logPro.e("message");
  logPro.s("message");
  logPro.f("message");
  logPro.d("message");

  // Example log messages
  logPro.info("This is an informational message.");
  logPro.warning("This is a warning message. " * 10,
      stackTrace: StackTrace.current);
  logPro2.error("no title" * 10, stackTrace: StackTrace.current);
  logPro.risk("This is a high-risk message.");
  logPro.normal("Normal logging message here.");
  logPro.magenta("Magenta logging message here.");
  logPro.logit("Logit logging message here.");
  logPro.grey("Grey logging message here.");
  logPro.green("Green logging message here. after 1 second.");

  logPro.whiteBlack("White and black logging message here.");

  // Example print messages
  ptr.info("This is an informational message.*******");
}
