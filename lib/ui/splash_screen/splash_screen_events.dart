import 'package:equatable/equatable.dart';

abstract class SplashScreenEvent extends Equatable {
  SplashScreenEvent([List props = const[]]) : super(props);
}

class SplashScreenStarted extends SplashScreenEvent {
  @override
  String toString() => 'Splash Screen Started';
}

class SplashScreenFinished extends SplashScreenEvent {
  @override
  String toString() => 'Splash Screen Finished';
}