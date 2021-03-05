import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginFlowTest/bloc/authentication_bloc.dart';
import 'package:loginFlowTest/bloc/authentication_event.dart';
import 'package:loginFlowTest/navigation/MainRouter.dart';
import 'package:loginFlowTest/repositories/authenticationRepository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(child: LoginForm()),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  String username;
  String password;

  String validator(String value) {
    if (value.isEmpty) {
      return 'Value can not be empty';
    }
    return null;
  }

  void login() async {
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();
      BlocProvider.of<AuthenticationBloc>(context)
          .add(LogIn(username: username, password: password));
      // MainRouter.router.navigateTo(context, 'app',
      //     transition: TransitionType.cupertino, clearStack: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            validator: validator,
            onSaved: (value) {
              setState(() {
                username = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              validator: validator,
              onSaved: (value) {
                setState(() {
                  password = value;
                });
              }),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: login,
            child: Text('Login'),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
