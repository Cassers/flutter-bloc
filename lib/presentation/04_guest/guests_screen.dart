import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final guestsBloc = context.read<GuestsBloc>();
          guestsBloc.add(AddGuestEvent(RandomGenerator.getRandomName()));
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    final guestsBloc = context.watch<GuestsBloc>();

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: GuestFilter.all, icon: Text('Todos')),
            ButtonSegment(value: GuestFilter.invited, icon: Text('Invitados')),
            ButtonSegment(
                value: GuestFilter.notInvited, icon: Text('No invitados')),
          ],
          selected: <GuestFilter>{guestsBloc.state.currentFilter},
          onSelectionChanged: (value) {
            guestsBloc.setFilter(value.first);
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: guestsBloc.state.totalFilteredGuests,
            itemBuilder: (context, index) {
              final guest = guestsBloc.state.filteredGuests[index];

              return SwitchListTile(
                  title: Text(guest.description),
                  value: guest.done,
                  onChanged: (value) {
                    if (value) {
                      guestsBloc.inviteGuest(guest.id);
                    } else {
                      guestsBloc.uninviteGuest(guest.id);
                    }
                  });
            },
          ),
        )
      ],
    );
  }
}
