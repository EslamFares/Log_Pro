import 'package:flutter_test/flutter_test.dart';
import 'package:log_pro/log_pro.dart';

import '../example/main.dart' as ex;

void main() {
  ex.logProTest();
  // ex.main();

  test('Log Pro test', () {
    LogPro logPro = LogPro();
    logPro.green("Hello Log Pro Test");
  });
}
