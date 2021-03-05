import 'package:fluro/fluro.dart';
import 'package:loginFlowTest/screens/App.dart';
import 'package:loginFlowTest/screens/loginScreen.dart';

class MainRouter {
  static FluroRouter router = FluroRouter();

  static Handler _loginHandler = Handler(
    handlerFunc: (context, parameters) => LoginScreen(),
  );

  static Handler _mainHandler = Handler(
    handlerFunc: (context, parameters) => App(),
  );

  static void setupRouter() {
    router.define('login', handler: _loginHandler);
    router.define('app', handler: _mainHandler);
  }
}
