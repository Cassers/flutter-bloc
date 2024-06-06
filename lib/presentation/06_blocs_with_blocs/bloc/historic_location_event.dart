part of 'historic_location_bloc.dart';

sealed class HistoricLocationEvent extends Equatable {
  const HistoricLocationEvent();

  @override
  List<Object> get props => [];
}

class NewLocationEvent extends HistoricLocationEvent {
  final (double latitude, double longitude) location;

  const NewLocationEvent(this.location);

  @override
  List<Object> get props => [location];
}