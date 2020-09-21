// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_user.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SignInUserSerializer implements Serializer<SignInUser> {
  @override
  Map<String, dynamic> toMap(SignInUser model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'email', model.email);
    setMapValueIfNotNull(ret, 'password', model.password);
    return ret;
  }

  @override
  SignInUser fromMap(Map map) {
    if (map == null) return null;
    final obj = SignInUser();
    obj.email = map['email'] as String ?? getJserDefault('email') ?? obj.email;
    obj.password =
        map['password'] as String ?? getJserDefault('password') ?? obj.password;
    return obj;
  }
}
