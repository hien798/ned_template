import 'package:equatable/equatable.dart';
import 'package:ned_template/data/api/models/response/user.dart';

abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super();

  @override
  List<Object> get props => props;
}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {}

class AuthError extends AuthState {
  final Object error;

  AuthError(this.error) : super([error]);
}

class UserLoaded extends AuthState {
  final User user;

  UserLoaded(this.user);

}