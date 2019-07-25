import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/splash_screen/splash_screen_bloc.dart';
import 'package:flutter_firebase/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/ui/splash_screen/splash_screen_events.dart';
import 'package:flutter_firebase/authentication/authentication_bloc.dart';

class SplashScreen extends StatelessWidget {
  final UserRepository userRepository;

  SplashScreen({Key key, @required this.userRepository}) : assert(userRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) {
        return SplashScreenBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          userRepository: userRepository)
          ..dispatch(SplashScreenStarted());
      },
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(25.0),
            decoration: FlutterLogoDecoration(),
          ),
        ),
      ),
    );
  }
}