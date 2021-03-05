import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:loginFlowTest/bloc/authentication_event.dart';
import 'package:loginFlowTest/bloc/authentication_state.dart';
import 'package:loginFlowTest/models/User.dart';
import 'package:loginFlowTest/repositories/authenticationRepository.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  User user;

  AuthenticationBloc({@required this.authenticationRepository})
      : super(AuthenticationUninitialised());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LogIn) {
      yield AuthenticationLoading();
      try {
        User user = await authenticationRepository.login(
            event.username, event.password);
        user = user;
        print(user.toString());
        yield AuthenticationAuthenticated(user);
      } catch (error) {
        yield AuthenticationError(error.toString());
      }
    } else if (event is LogOut) {
      user = null;
      yield AuthenticationUnauthenticated();
    } else if (event is AppStarted) {
      print(user);
      if (user != null) {
        yield AuthenticationAuthenticated(user);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
  }

  @override
  Map<String, dynamic> toJson(AuthenticationState state) {
    print('to');
    return {
      'firstname': state.user?.firstName,
      'lastname': state.user?.lastName,
      "image": state.user?.imageUrl
    };
  }

  @override
  AuthenticationState fromJson(Map<String, dynamic> json) {
    print(json);
    if (json['firstname'] != null && json["lastname"] != null) {
      user = User(
          firstName: json['firstname'],
          lastName: json['lastname'],
          imageUrl: json['image']);
      return AuthenticationAuthenticated(user);
    } else {
      return AuthenticationUnauthenticated();
    }
  }
}
