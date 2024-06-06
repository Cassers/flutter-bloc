import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationState()){
    on<NewLocationEvent>(_onNewLocation);
  }

  void _onNewLocation(NewLocationEvent event, Emitter<HistoricLocationState> emit) {
    emit(state.copyWith(
      locations: [...state.locations, event.location],
    ));
  }

  void onNewUserLocation((double latitude, double longitude) location) {
    print('Number of locations: ${state.locations.length}');
    add(NewLocationEvent(location));
  }
}
