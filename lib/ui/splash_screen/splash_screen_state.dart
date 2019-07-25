import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  SplashScreenState([List props = const []]) : super(props);
}

class SplashScreenInitial extends SplashScreenState {
  @override
  String toString() => 'Splash Screen Initial';
}

class SplashScreenFinished extends SplashScreenState {
  @override
  String toString() => 'Splash Screen Finish';
}

class SplashScreenFailure extends SplashScreenState {
  final String error;

  SplashScreenFailure({@required this.error}) : super([error]);

  @override
  String toString()  => 'SplashScreenFailure { error: $error}';
}