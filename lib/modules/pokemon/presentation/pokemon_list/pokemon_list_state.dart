import '../../domain/model/pokemon/pokemon_model.dart';

abstract class PokemonListState {}

class LoadingPokemonListState implements PokemonListState {}

class SuccessPokemonListState implements PokemonListState {
  SuccessPokemonListState(
    this.pokemonList,
  );

  final List<PokemonModel> pokemonList;
}

class ErrorPokemonListState implements PokemonListState {
  ErrorPokemonListState(
    this.exception,
  );

  final Exception exception;
}
