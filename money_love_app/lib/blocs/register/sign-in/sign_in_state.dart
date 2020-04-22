part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  final bool isSave;

  SignInState(this.isSave);
}

class SignInWaittingState extends SignInState {
  SignInWaittingState(bool isSave) : super(isSave);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SignInSaveAccountState extends SignInState {
  SignInSaveAccountState(bool isSave) : super(isSave);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SignInSuccessState extends SignInState {
  SignInSuccessState(bool isSave) : super(isSave);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SignInFailureState extends SignInState {
  final String error;

  SignInFailureState(this.error, bool isSave) : super(false);
  @override
  // TODO: implement props
  List<Object> get props => [this..error];

}