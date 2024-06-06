import 'package:blocs_app/config/helpers/pokemon_information.dart';
import 'package:blocs_app/presentation/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {

  int _pokemonId = 1;

  @override
  Widget build(BuildContext context) {

    final pokemonBloc = context.watch<PokemonBloc>();

    return Scaffold(
        appBar: AppBar(
          title: Text('PokemonID: $_pokemonId'),
        ),
        body: FutureBuilder(
          future: pokemonBloc.fetchPokemonName(_pokemonId),
          initialData: pokemonBloc.state.pokemons[_pokemonId] ?? 'Loading...',
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: Column(
                children: [
                  Text(snapshot.data.toString()),
                  Image(
                    image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$_pokemonId.png'),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn-add',
              child: const Icon(Icons.plus_one),
              onPressed: () {
                setState(() {
                  _pokemonId++;
                });
              },
            ),

            const SizedBox(height: 15),

            FloatingActionButton(
              heroTag: 'btn-minus',
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                setState(() {
                  if (_pokemonId <= 1) return;
                  _pokemonId--;
                });
              },
            ),
          ],
        ));
  }
}
