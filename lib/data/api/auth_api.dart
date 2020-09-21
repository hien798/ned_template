import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/client/client.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'auth_api.jretro.dart';

@GenApiClient()
class AuthApi extends ApiClient with _$AuthApiClient {
  final Route base;
  @override
  final Map<String, CodecRepo> converters;
  final Duration timeout;

  AuthApi({
    this.base,
    this.converters,
    this.timeout = const Duration(minutes: 2),
  });
}
