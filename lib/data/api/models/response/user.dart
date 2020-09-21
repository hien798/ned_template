import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user.jser.dart';

class User {
  @Alias('email', isNullable: false)
  final String email;

  @Alias('username', isNullable: false)
  final String username;

  @Alias('fullName', isNullable: false)
  final String fullName;

  @Alias('phone', isNullable: false)
  final String phone;

  @Alias('image', isNullable: false)
  final String image;

  @Alias('token', isNullable: false)
  final String token;

  User({
    this.email,
    this.username,
    this.fullName,
    this.phone,
    this.image,
    this.token,
  });
}

@GenSerializer(nullableFields: true)
class UserSerializer extends Serializer<User> with _$UserSerializer {}
