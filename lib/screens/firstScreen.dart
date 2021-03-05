import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginFlowTest/bloc/authentication_bloc.dart';
import 'package:loginFlowTest/bloc/authentication_event.dart';
import 'package:loginFlowTest/bloc/authentication_state.dart';
import 'package:loginFlowTest/navigation/FirstRouter.dart';
import 'package:loginFlowTest/navigation/MainRouter.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key key}) : super(key: key);

  void navigate(BuildContext context) {
    // FirstRouter.router.navigateTo(context, 'third');
    BlocProvider.of<AuthenticationBloc>(context).add(LogOut());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticationAuthenticated) {
                    return Text(state.user.toString());
                  } else {
                    return SizedBox();
                  }
                },
              ),
              RaisedButton(
                  onPressed: () => navigate(context),
                  child: Text('Go to Third'))
            ],
          ),
        ));
  }
}
