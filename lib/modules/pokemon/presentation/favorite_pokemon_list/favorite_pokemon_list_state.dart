import 'package:equatable/equatable.dart';

import '../../domain/model/pokemon/pokemon_model.dart';

abstract class FavoritePokemonListState {}

class LoadingFavoritePokemonListState extends Equatable
    implements FavoritePokemonListState {
  @override
  List<Object?> get props => [];
}

class SuccessFavoritePokemonListState extends Equatable
    implements FavoritePokemonListState {
  const SuccessFavoritePokemonListState(
    this.favoritePokemonList,
  );

  final List<PokemonModel> favoritePokemonList;

  @override
  List<Object?> get props => [
        favoritePokemonList,
      ];
}

class ErrorFavoritePokemonListState extends Equatable
    implements FavoritePokemonListState {
  const ErrorFavoritePokemonListState(
    this.exception,
  );

  final Exception exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}
