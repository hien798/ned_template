import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:validations/annotations.dart';
import 'package:validations/validations.dart';

part 'sign_in_user.g.dart';
part 'sign_in_user.jser.dart';

class SignInUser {
  @Alias('email', isNullable: false)
  @Email(message: 'Please enter your email')
  String email;

  @Alias('password', isNullable: false)
  @NotEmpty(message: 'Please enter your password')
  @Size(
    min: 8,
    max: 30,
    message: r'password length must be between $min and $max',
  )
  String password;

  SignInUser({
    this.email,
    this.password,
  });
}

@GenSerializer(nullableFields: true)
class SignInUserSerializer extends Serializer<SignInUser> with _$SignInUserSerializer {}

@GenValidator()
class SignInUserValidator extends Validator<SignInUser> with _$SignInUserValidator {}
