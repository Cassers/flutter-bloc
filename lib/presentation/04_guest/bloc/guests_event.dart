part of 'guests_bloc.dart';


sealed class GuestsEvent extends Equatable {

  const GuestsEvent();

  @override
  List<Object> get props => [];
}


final class SetAllFilterEvent extends GuestsEvent {}
final class SetInvitedFilterEvent extends GuestsEvent {}
final class SetNotInvitedFilterEvent extends GuestsEvent {}

final class SetCustomFilterEvent extends GuestsEvent {
  final GuestFilter newFilter;
  const SetCustomFilterEvent(this.newFilter);

  @override
  List<Object> get props => [newFilter];

}

final class AddGuestEvent extends GuestsEvent {
  final String name;
  const AddGuestEvent(this.name);

  @override
  List<Object> get props => [name];
}

final class InviteGuestEvent extends GuestsEvent {
  final String id;
  const InviteGuestEvent(this.id);

  @override
  List<Object> get props => [id];
}

final class UninviteGuestEvent extends GuestsEvent {
  final String id;
  const UninviteGuestEvent(this.id);

  @override
  List<Object> get props => [id];
}