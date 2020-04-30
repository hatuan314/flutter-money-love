import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_exchange_event.dart';
part 'new_exchange_state.dart';

class NewExchangeBloc extends Bloc<NewExchangeEvent, NewExchangeState> {
  int _exchangeIndex = 1;
  int _consumptionId = 0;
  @override
  // TODO: implement initialState
  NewExchangeState get initialState => NewExchangeWaitingState(1, 0);

  @override
  Stream<NewExchangeState> mapEventToState(NewExchangeEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SwitchExchangeOnPressEvent)
      yield* _mapSwitchExchangeEventToState(event.exchangeIndex);
    else if (event is SelectConsumptionMemberEvent)
      yield* _mapSelectConsumptionMemberEventToState(event.consumptionId);
  }

  Stream<NewExchangeState> _mapSwitchExchangeEventToState(int switchIndex) async* {
    yield SwitchExchangeState(_exchangeIndex, _consumptionId);
    _exchangeIndex = switchIndex;
    _consumptionId = 0;
    yield NewExchangeWaitingState(_exchangeIndex, _consumptionId);
  }

  Stream<NewExchangeState> _mapSelectConsumptionMemberEventToState(int consumptionId) async* {
    yield SelectConsumptionMemberState(_exchangeIndex, _consumptionId);
    _consumptionId = consumptionId;
    print('$consumptionId');
    yield NewExchangeWaitingState(_exchangeIndex, _consumptionId);
  }

}