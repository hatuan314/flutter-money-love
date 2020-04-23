part of "splash_bloc.dart";

abstract class SplashEvent extends Equatable {}

class RandomCircleEvent extends SplashEvent {
  final double width;
  final double height;

  RandomCircleEvent(this.width, this.height);

  @override
  // TODO: implement props
  List<Object> get props => [this.width, this.height];
}
