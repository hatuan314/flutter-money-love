part of 'new_exchange_bloc.dart';

abstract class NewExchangeState extends Equatable {
  final int switchIndex;
  final int consumptionId;

  NewExchangeState(this.switchIndex, this.consumptionId);
}

class NewExchangeWaitingState extends NewExchangeState {
  NewExchangeWaitingState(int switchIndex, int consumptionId)
      : super(switchIndex, consumptionId);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SwitchExchangeState extends NewExchangeState {
  SwitchExchangeState(int switchIndex, int consumptionId)
      : super(switchIndex, consumptionId);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SelectConsumptionMemberState extends NewExchangeState {
  SelectConsumptionMemberState(int switchIndex, int consumptionId)
      : super(switchIndex, consumptionId);

  @override
  // TODO: implement props
  List<Object> get props => null;
}
