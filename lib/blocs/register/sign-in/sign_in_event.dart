part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {}

class SaveAccountOnPressEvent extends SignInEvent {
  final bool isSave;
  SaveAccountOnPressEvent(this.isSave);

  @override
  // TODO: implement props
  List<Object> get props => [this.isSave];
}

class ShowPasswordOnPressEvent extends SignInEvent {
  final bool isShow;

  ShowPasswordOnPressEvent(this.isShow);
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SignInButtonOnPressEvent extends SignInEvent {
  final String account;
  final String password;

  SignInButtonOnPressEvent(this.account, this.password);

  @override
  // TODO: implement props
  List<Object> get props => [this.account, this.password];
}

class FacebookButtonOnPressEvent extends SignInEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class GoogleButtonOnPressEvent extends SignInEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
