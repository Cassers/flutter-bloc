import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int pokemonId) _fetchPokemonName;

  PokemonBloc({
    required Future<String> Function(int pokemonId) fetchPokemon,
  }) : 
    _fetchPokemonName = fetchPokemon,
    super(const PokemonState()){
    on<AddPokemonEvent>(_addPokemon);
  }


  Future fetchPokemonName(int id) async {

    if(state.pokemons.containsKey(id)){
      return state.pokemons[id]!;
    }

    try{
      final pokemonName = await _fetchPokemonName(id);
      add(AddPokemonEvent(id, pokemonName));
      return pokemonName;
    // ignore: empty_catches
    } catch(e){
    }
  }

  void _addPokemon(AddPokemonEvent event, Emitter<PokemonState> emit) {

    final newPokemons = Map<int, String>.from(state.pokemons);
    newPokemons[event.id] = event.pokemonName;
    emit(state.copyWith(pokemons: newPokemons));
  }
}
