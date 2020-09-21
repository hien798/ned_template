import 'package:event_bus/event_bus.dart';
import 'package:ned_template/data/api/api.dart';
import 'package:ned_template/data/api/auth_api.dart';

class AuthRepository extends EventBus {
  final AppApi api;
  final AuthApi authApi;

  AuthRepository({
    this.api,
    this.authApi,
  });

  Future<bool> isAuthenticated() async {
    // final token = await ...
    return true;
  }
}
