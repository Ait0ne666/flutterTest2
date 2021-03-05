import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loginFlowTest/models/User.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  final User user;
  const AuthenticationState(this.user);

  @override
  List<Object> get props => [];
}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;
  const AuthenticationAuthenticated(this.user) : super(user);

  @override
  List<Object> get props => [user];
}

class AuthenticationUnauthenticated extends AuthenticationState {
  AuthenticationUnauthenticated() : super(null);
}

class AuthenticationLoading extends AuthenticationState {
  AuthenticationLoading() : super(null);
}

class AuthenticationUninitialised extends AuthenticationState {
  AuthenticationUninitialised() : super(null);
}

class AuthenticationError extends AuthenticationState {
  final String message;

  const AuthenticationError(
    this.message,
  ) : super(null);

  @override
  List<Object> get props => [message];
}
