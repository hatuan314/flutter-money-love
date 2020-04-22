part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {}

class SplashInitState extends SplashState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SplashRandomSuccessState extends SplashState {
  final List<Circle> allCircles;

  SplashRandomSuccessState(this.allCircles);

  @override
  // TODO: implement props
  List<Object> get props => [this.allCircles];
}
