import 'package:log_pro/log_pro.dart';

void main() {
  // Create a LogPro instance
  final logPro = LogPro();
  final logPro2 = LogPro(simpleShapeLog: true, stackTraceLinesToShow: 1);
  //stop log
  // final logPro = LogPro(isLoggingEnabled: false);

  //use print
  final ptr = LogPro(
    title: "LogPro",
    usePrint: true,
    isLoggingEnabled: true,
  );

  // Example log messages
  logPro.info("This is an informational message.");
  logPro.warning("This is a warning message. " * 10,
      stackTrace: StackTrace.current);
  logPro2.error("An error occurred. " * 10, stackTrace: StackTrace.current);
  logPro.risk("This is a high-risk message.");
  logPro.normal("Normal logging message here.");
  logPro.magenta("Magenta logging message here.");
  logPro.logit("Logit logging message here.");
  logPro.grey("Grey logging message here.");
  logPro.green("Green logging message here.");
  logPro.whiteBlack("White and black logging message here.");

  // Example print messages
  ptr.info("This is an informational message.");
}
