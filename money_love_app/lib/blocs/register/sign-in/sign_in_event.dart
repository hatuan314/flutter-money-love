part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {

}

class SaveAccountOnPressEvent extends SignInEvent {
  final bool isSave;

  SaveAccountOnPressEvent(this.isSave);
  @override
  // TODO: implement props
  List<Object> get props => [this.isSave];

}