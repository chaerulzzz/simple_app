import 'package:flutter/material.dart';
import 'package:flutter_firebase/authentication/authentication_bloc.dart';
import 'package:flutter_firebase/ui/login/login_bloc.dart';
import 'package:flutter_firebase/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/ui/login/login_form.dart';

class LoginPage extends StatelessWidget{
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository}) : assert(userRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        builder: (context) {
          return LoginBloc (
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}