import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  bool _isSave = false;
  @override
  // TODO: implement initialState
  SignInState get initialState => SignInWaittingState(this._isSave);

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SaveAccountOnPressEvent) {
      yield SignInSaveAccountState(this._isSave);
      this._isSave = event.isSave;
      yield SignInWaittingState(this._isSave);
    }
  }

}