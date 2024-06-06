import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {

  GuestsBloc() : super(GuestsState(
    guests: [
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.fromMicrosecondsSinceEpoch(324234234)),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    ]
  )) {
   
    //Filter
    on<SetCustomFilterEvent>(_changeFilter);

    //Guest
    on<AddGuestEvent>(_createGuest);
    on<InviteGuestEvent>(_inviteGuest);
    on<UninviteGuestEvent>(_uninviteGuest);
  }

  void setFilter(GuestFilter filter) {
    add(SetCustomFilterEvent(filter));
  }
  void _changeFilter(SetCustomFilterEvent event, Emitter<GuestsState> emit) {
    emit(state.copyWith(currentFilter: event.newFilter));
  }

  void addGuest(String name) {
    add(AddGuestEvent(name));
  }

  void _createGuest(AddGuestEvent event, Emitter<GuestsState> emit) {
    final newGuest = Todo(
      id: uuid.v4(),
      description: event.name,
      completedAt: null,
    );

    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void inviteGuest(String id) {
    add(InviteGuestEvent(id));
  }

  void _inviteGuest(InviteGuestEvent event, Emitter<GuestsState> emit) {
    final updatedGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(completedAt: DateTime.now());
      }
      return guest;
    }).toList();

    emit(state.copyWith(guests: updatedGuests));
  }
  
  void uninviteGuest(String id) {
    add(UninviteGuestEvent(id));
  }

  void _uninviteGuest(UninviteGuestEvent event, Emitter<GuestsState> emit) {
    final updatedGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(completedAt: null);
      }
      return guest;
    }).toList();

    emit(state.copyWith(guests: updatedGuests));
  }
}
