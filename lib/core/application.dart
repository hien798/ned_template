import 'package:ned_template/core/repositories/auth_repository.dart';
import 'package:ned_template/data/api/api.dart';
import 'package:ned_template/features/auth/bloc/auth_bloc.dart';
import 'package:ned_template/features/auth/bloc/auth_event.dart';
import 'package:ned_template/features/auth/bloc/auth_state.dart';

class Application {
  AuthRepository authRepository;
  AuthBloc authBloc;

  AppApi _api;

  Application();

  Future<void> setup() async {
    _api = AppApi();
    await setupRepositories();

    final accessToken = null;
    var isAuthenticated = false;
    if (accessToken != null) {
      try {
        isAuthenticated = true;
      } catch (error) {}
    }

    setupBlocs(isAuthenticated: isAuthenticated);
  }

  Future<void> setupRepositories() async {
    final authApi = _api.getAuthApi();
    authRepository = AuthRepository(api: _api, authApi: authApi);
  }

  void setupBlocs({bool isAuthenticated}) {
    authBloc = AuthBloc(
        initialState: isAuthenticated ? Authenticated() : UnAuthenticated(),
        authRepository: authRepository);
  }

  Future<void> init() async {
    if (await authRepository.isAuthenticated()) {
      authBloc.add(LoadUserEvent());
    }
  }

  void close() {
    authBloc.close();
  }
}
