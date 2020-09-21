import 'dart:async';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:http/io_client.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:ned_template/data/api/auth_api.dart';
import 'package:ned_template/data/api/models/request/sign_in_user.dart';

class AppApi {
  String basePath = "http://localhost";
  Route _baseRoute;
  final Duration timeout;
  final _interceptor = BearerToken();
  final _logInterceptor = LogInterceptor();

  AppApi({String baseUrl, this.timeout = const Duration(minutes: 2)}) {
    _baseRoute = Route(baseUrl ?? basePath)
        .withClient(globalClient ?? IOClient()) as Route;

    _baseRoute.before(_interceptor.before).after(_interceptor.after);
    _baseRoute.before(_logInterceptor.before).after(_logInterceptor.after);
  }

  setBearerToken(String token) {
    _interceptor.token = token;
  }

  removeBearerToken() {
    _interceptor.token = null;
  }

  AuthApi getAuthApi({Route base, Map<String, CodecRepo> converters}) {
    base ??= _baseRoute;
    converters ??= defaultConverters;
    return AuthApi(base: base, converters: converters, timeout: timeout);
  }
}

class LogInterceptor extends Interceptor {
  @override
  FutureOr<void> before(RouteBase route) {
    print('AUTH HEADER: ${route.getAuthHeaders}');
    print('HEADERS: ${route.getHeaders}');
    print('URL: ${route.getUrl}');
    return super.before(route);
  }

  @override
  FutureOr after(StringResponse response) {
    print(response.toString());
    return Future.value(response);
  }
}

final Map<String, CodecRepo> defaultConverters = {
  MimeTypes.json: _jsonJaguarRepo,
};

final _jsonJaguarRepo = JsonRepo()..add(SignInUserSerializer());
