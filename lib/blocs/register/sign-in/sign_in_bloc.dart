import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyloveapp/services/register/regiser_service.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  RegisterRepository _repository = RegisterRepository();
  bool _isSave = false;
  bool _isShow = false;

  @override
  // TODO: implement initialState
  SignInState get initialState =>
      SignInWaittingState(this._isSave, this._isShow);

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SaveAccountOnPressEvent)
      yield* _mapSaveAccountEventToState(event);
    else if (event is ShowPasswordOnPressEvent)
      yield* _mapShowPasswordEventToState(event.isShow);
    else if (event is SignInButtonOnPressEvent)
      yield* _mapSignInButtonEventToState(event.account, event.password);
    else if (event is FacebookButtonOnPressEvent)
      yield* _mapFacebookSignInEventToState();
    else if (event is GoogleButtonOnPressEvent)
      yield* _mapGoogleSignInEventToState();
  }

  Stream<SignInState> _mapSaveAccountEventToState(
      SaveAccountOnPressEvent event) async* {
    yield SignInSaveAccountState(this._isSave, this._isShow);
    this._isSave = event.isSave;
    yield SignInWaittingState(this._isSave, this._isShow);
  }

  Stream<SignInState> _mapShowPasswordEventToState(bool isShow) async* {
    yield SignInShowPasswordState(this._isSave, this._isShow);
    this._isShow = isShow;
    yield SignInWaittingState(this._isSave, this._isShow);
  }

  Stream<SignInState> _mapSignInButtonEventToState(
      String account, String password) async* {
    yield SignInLoadingState(this._isSave, this._isShow);
    debugPrint('Sign In');
    yield SignInSuccessState(this._isSave, this._isShow);
  }

  Stream<SignInState> _mapFacebookSignInEventToState() async* {
    yield SignInLoadingState(this._isSave, this._isShow);
    debugPrint('Facebook Sign In');
    yield SignInSuccessState(this._isSave, this._isShow);
  }

  Stream<SignInState> _mapGoogleSignInEventToState() async* {
    yield SignInLoadingState(this._isSave, this._isShow);
    await _repository.googleSignInRepository();
    yield SignInSuccessState(this._isSave, this._isShow);
  }
}
