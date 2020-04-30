part of 'new_exchange_bloc.dart';

abstract class NewExchangeEvent extends Equatable {}

class SwitchExchangeOnPressEvent extends NewExchangeEvent {
  final int exchangeIndex;

  SwitchExchangeOnPressEvent(this.exchangeIndex);

  @override
  // TODO: implement props
  List<Object> get props => [this.exchangeIndex];
}

class SelectConsumptionMemberEvent extends NewExchangeEvent {
  final int consumptionId;

  SelectConsumptionMemberEvent(this.consumptionId);

  @override
  // TODO: implement props
  List<Object> get props => [this.consumptionId];
}
