part of 'historic_location_bloc.dart';

class HistoricLocationState extends Equatable {

  final List<(double latitude, double longitude)> locations;

  const HistoricLocationState({
    this.locations = const [],
  });

  int get numberOfLocations => locations.length;
  
  HistoricLocationState copyWith({
    List<(double latitude, double longitude)>? locations,
  }) {
    return HistoricLocationState(
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object> get props => [locations];
}

final class HistoricLocationInitial extends HistoricLocationState {}
