import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyloveapp/models/splash/circle.dart';

part "splash_event.dart";
part "splash_state.dart";

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  @override
  // TODO: implement initialState
  SplashState get initialState => SplashInitState();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    // TODO: implement mapEventToState
    if (event is RandomCircleEvent) {
      List<Circle> allCirlces = List<Circle>();
      for (int index = 0; index < 3; index++) {
        Circle circle;
        circle.dX = Random().nextInt(event.width.ceil()).ceilToDouble();
        circle.dY = Random().nextInt(event.height.ceil()).ceilToDouble();
        allCirlces.add(circle);
      }
      yield SplashRandomSuccessState(allCirlces);
    }
  }
}
