part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {

}

class SignUpShowPassOnPressEvent extends SignUpEvent {
  final bool isShow;

  SignUpShowPassOnPressEvent(this.isShow);
  @override
  // TODO: implement props
  List<Object> get props => [this.isShow];

}

class BtnSignUpOnPressEvent extends SignUpEvent {
  final UserSignUp user;

  BtnSignUpOnPressEvent(this.user);
  @override
  // TODO: implement props
  List<Object> get props => [this.user];

}