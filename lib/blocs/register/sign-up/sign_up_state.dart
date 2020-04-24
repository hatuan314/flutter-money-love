part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
 final bool isShow;

  SignUpState(this.isShow);
}

class SignUpWaittingState extends SignUpState {
  SignUpWaittingState(bool isShow) : super(isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SignUpShowPasswordState extends SignUpState {
  SignUpShowPasswordState(bool isShow) : super(isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SignUpLoadingState extends SignUpState {
  SignUpLoadingState(bool isShow) : super(isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SignUpSuccessState extends SignUpState {
  SignUpSuccessState(bool isShow) : super(isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SignUpFailureState extends SignUpState {
  SignUpFailureState(bool isShow) : super(isShow);

  @override
  // TODO: implement props
  List<Object> get props => null;

}