import 'package:fluro/fluro.dart';
import 'package:loginFlowTest/screens/fourthScreen.dart';
import 'package:loginFlowTest/screens/secondScreen.dart';

class SecondRouter {
  static FluroRouter router = FluroRouter();

  static Handler _secondHandler = Handler(
    handlerFunc: (context, parameters) => SecondScreen(),
  );
  static Handler _fourthHandler = Handler(
    handlerFunc: (context, parameters) => FourthScreen(),
  );
  static void setupRouter() {
    router.define('second', handler: _secondHandler);
    router.define('fourth', handler: _fourthHandler);
  }
}
