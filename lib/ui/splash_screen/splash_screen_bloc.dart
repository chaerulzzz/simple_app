import 'dart:async';
import 'package:flutter_firebase/authentication/authentication_bloc.dart';
import 'package:flutter_firebase/authentication/authentication_events.dart';
import 'package:flutter_firebase/ui/splash_screen/splash_screen_events.dart';
import 'package:flutter_firebase/ui/splash_screen/splash_screen_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/repository/user_repository.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent , SplashScreenState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SplashScreenBloc({
    @required this.userRepository,
    @required this.authenticationBloc
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);


  @override
  SplashScreenState get initialState => SplashScreenInitial();

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event) async* {
    if (event is SplashScreenStarted) {
      
      final storage = new FlutterSecureStorage();
      bool token = await userRepository.hasToken();
      try {
        
        if (!token) {
          await storage.write(key: 'username', value: 'admin');
          await storage.write(key: 'password', value: 'admin123');
        } else {
          authenticationBloc.dispatch(BypassLogin());
        }
       
        await Future.delayed(Duration(seconds: 1));
        yield SplashScreenInitial();      
      } catch (error) {
        yield SplashScreenFailure(error: error.toString());
      }
    } 

  }
}