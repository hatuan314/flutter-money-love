part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  final bool isSave;
  final bool isShow;

  SignInState(this.isSave, this.isShow);
}

class SignInWaittingState extends SignInState {
  SignInWaittingState(bool isSave, bool isShow) : super(isSave, isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SignInSaveAccountState extends SignInState {
  SignInSaveAccountState(bool isSave, bool isShow) : super(isSave, isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SignInShowPasswordState extends SignInState {
  SignInShowPasswordState(bool isSave, bool isShow) : super(isSave, isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;

}


class SignInLoadingState extends SignInState {
  SignInLoadingState(bool isSave, bool isShow) : super(isSave, isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SignInSuccessState extends SignInState {
  SignInSuccessState(bool isSave, bool isShow) : super(isSave, isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SignInFailureState extends SignInState {
  final String error;

  SignInFailureState(this.error, bool isSave, bool isShow) : super(isSave, isShow);
  @override
  // TODO: implement props
  List<Object> get props => [this..error];
}
