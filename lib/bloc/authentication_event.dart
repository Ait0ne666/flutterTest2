import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loginFlowTest/models/User.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LogIn extends AuthenticationEvent {
  final String username;
  final String password;

  LogIn({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}

class LogOut extends AuthenticationEvent {}
