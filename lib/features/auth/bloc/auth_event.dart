
import 'package:ned_template/data/api/models/request/sign_in_user.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final SignInUser user;

  SignInEvent(this.user);
}

class LoadUserEvent extends AuthEvent {

}