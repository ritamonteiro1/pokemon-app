import 'package:equatable/equatable.dart';

import '../../domain/model/pokemon/pokemon_model.dart';

abstract class PokemonListState {}

class LoadingPokemonListState extends Equatable implements PokemonListState {
  @override
  List<Object?> get props => [];
}

class SuccessPokemonListState extends Equatable implements PokemonListState {
  const SuccessPokemonListState(
    this.pokemonList,
  );

  final List<PokemonModel> pokemonList;

  @override
  List<Object?> get props => [
        pokemonList,
      ];
}

class ErrorPokemonListState extends Equatable implements PokemonListState {
  const ErrorPokemonListState(
    this.exception,
  );

  final Exception exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}
