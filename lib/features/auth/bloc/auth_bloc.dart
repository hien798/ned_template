import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:ned_template/core/repositories/auth_repository.dart';
import 'package:ned_template/features/auth/bloc/auth_event.dart';
import 'package:ned_template/features/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final AuthState initialState;

  AuthBloc({
    this.initialState,
    this.authRepository,
  }) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignInEvent) {
      yield* _signIn(event);
    } else if (event is LoadUserEvent) {
      yield* _getCurrentUser(event);
    }
  }

  Stream<AuthState> _signIn(SignInEvent event) async* {
    try {
      // final rs
    } catch (error) {
      yield AuthError(error);
    }
  }

  Stream<AuthState> _getCurrentUser(LoadUserEvent event) async* {
    try {
      // final rs
    } catch (error) {
      yield AuthError(error);
    }
  }

  String _parseError(Object error) {
    String errorStr = '';
    if (error is StringResponse) {
      try {
        final body = jsonDecode(error.body) as Map<String, dynamic>;

        final mess = body['message'] as List<dynamic>;
        final first = mess.first;
        final constraints = first['constraints'] as Map<String, dynamic>;
        constraints.forEach((key, value) {
          errorStr = errorStr + '$key: $value\n';
        });
        return errorStr;
      } catch (e) {
        print(e);
        return 'Something went wrong! Try again!';
      }
    }
    return 'Something went wrong! Try again!';
  }
}
