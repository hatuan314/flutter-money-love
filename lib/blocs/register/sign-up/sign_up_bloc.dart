import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyloveapp/models/models.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  bool _isShow = false;
  @override
  // TODO: implement initialState
  SignUpState get initialState => SignUpWaittingState(this._isShow);

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SignUpShowPassOnPressEvent)
      yield* _mapShowPassEventToState(event.isShow);
    else if (event is BtnSignUpOnPressEvent)
      yield* _mapBtnSignUpEventToState(event.user);
  }

  Stream<SignUpState> _mapShowPassEventToState(bool isShow) async* {
    yield SignUpShowPasswordState(this._isShow);
    this._isShow = isShow;
    yield SignUpWaittingState(this._isShow);
  }

  Stream<SignUpState> _mapBtnSignUpEventToState(UserSignUp user) async* {
    yield SignUpLoadingState(this._isShow);
    yield SignUpSuccessState(this._isShow);
  }

}