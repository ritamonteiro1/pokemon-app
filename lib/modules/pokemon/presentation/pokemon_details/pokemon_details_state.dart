import 'package:equatable/equatable.dart';

import '../../domain/model/pokemon/pokemon_model.dart';

abstract class PokemonDetailsState {}

class LoadingPokemonDetailsState extends Equatable
    implements PokemonDetailsState {
  @override
  List<Object?> get props => [];
}

class InitialPokemonDetailsState extends Equatable
    implements PokemonDetailsState {
  const InitialPokemonDetailsState(
    this.pokemonModel,
  );

  final PokemonModel pokemonModel;

  @override
  List<Object?> get props => [];
}

class SuccessPokemonDetailsState implements PokemonDetailsState {
  SuccessPokemonDetailsState(
    this.pokemonModel,
  );

  final PokemonModel pokemonModel;
}
