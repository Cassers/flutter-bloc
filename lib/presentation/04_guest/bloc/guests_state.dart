part of 'guests_bloc.dart';

enum GuestFilter { 
  all,
  invited,
  notInvited
}

class GuestsState extends Equatable {

  final GuestFilter currentFilter;

  final List<Todo> guests;
  int get totalGuests => guests.length;
  
  List<Todo> get invitedGuests => guests.where((element) => element.completedAt != null).toList();
  int get totalInvited => guests.where((element) => element.done).length;
  
  List<Todo> get notInvitedGuests => guests.where((element) => element.completedAt == null).toList();
  int get totalNotInvited => guests.where((element) => !element.done).length;

  List<Todo> get filteredGuests {
    switch (currentFilter) {
      case GuestFilter.invited:
        return invitedGuests;
      case GuestFilter.notInvited:
        return notInvitedGuests;
      case GuestFilter.all:
        return guests;
    }
  }
  int get totalFilteredGuests => filteredGuests.length;

  const GuestsState({
    this.currentFilter = GuestFilter.all,
    this.guests = const [],
  });

  @override
  List<Object> get props => [currentFilter, guests];

  GuestsState copyWith({
    GuestFilter? currentFilter,
    List<Todo>? guests,
  }) => GuestsState(
    currentFilter: currentFilter ?? this.currentFilter,
    guests: guests ?? this.guests,
  );
}

final class GuestsInitial extends GuestsState {}
