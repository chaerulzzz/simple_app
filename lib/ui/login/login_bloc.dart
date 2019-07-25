import 'dart:async';
import 'package:flutter_firebase/authentication/authentication_bloc.dart';
import 'package:flutter_firebase/ui/login/login_state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/repository/user_repository.dart';
import 'package:flutter_firebase/ui/login/login_events.dart';
import 'package:flutter_firebase/authentication/authentication_events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        if (token != 'token') {
          yield LoginFailure(error: token);
        } else {
          authenticationBloc.dispatch(LoggedIn(token: token));
          yield LoginInitial();
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}