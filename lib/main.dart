import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:loginFlowTest/bloc/authentication_bloc.dart';
import 'package:loginFlowTest/bloc/authentication_event.dart';
import 'package:loginFlowTest/bloc/authentication_state.dart';
import 'package:loginFlowTest/navigation/MainRouter.dart';
import 'package:loginFlowTest/repositories/authenticationRepository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  MainRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc(
        authenticationRepository: FakeAuthenticationRepository());
    authenticationBloc.add(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => authenticationBloc,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: MainRouter.router.generator,
          home: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              print(state);
              if (state is AuthenticationAuthenticated) {
                MainRouter.router.navigateTo(context, 'app',
                    transition: TransitionType.cupertino,
                    rootNavigator: true,
                    clearStack: true);
              } else {
                MainRouter.router.navigateTo(context, 'login',
                    transition: TransitionType.fadeIn,
                    rootNavigator: true,
                    clearStack: true);
              }
            },
            child: Scaffold(
              body: Container(
                child: Text('loading'),
              ),
            ),
          )),
    );
  }
}
