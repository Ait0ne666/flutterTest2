import 'package:fluro/fluro.dart';
import 'package:loginFlowTest/screens/firstScreen.dart';
import 'package:loginFlowTest/screens/thirdScreen.dart';

class FirstRouter {
  static FluroRouter router = FluroRouter();

  static Handler _firstHandler = Handler(
    handlerFunc: (context, parameters) => FirstScreen(),
  );
  static Handler _thirdHandler = Handler(
    handlerFunc: (context, parameters) => ThirdScreen(),
  );

  static void setupRouter() {
    router.define('first', handler: _firstHandler);
    router.define('third', handler: _thirdHandler);
  }
}
