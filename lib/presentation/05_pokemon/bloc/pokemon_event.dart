part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];

}

final class AddPokemonEvent extends PokemonEvent {
  final int id;
  final String pokemonName;

  const AddPokemonEvent(this.id, this.pokemonName);

  @override
  List<Object> get props => [id, pokemonName];
  
}