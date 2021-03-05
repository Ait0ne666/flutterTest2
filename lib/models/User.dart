import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String firstName;
  final String lastName;
  final String imageUrl;

  User({this.firstName, this.imageUrl, this.lastName});

  @override
  List<Object> get props => [firstName, lastName, imageUrl];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['results'][0]["name"]["first"],
        lastName: json['results'][0]["name"]["last"],
        imageUrl: json['results'][0]["picture"]["medium"]);
  }

  @override
  String toString() {
    return "$firstName $lastName";
  }
}
