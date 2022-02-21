import '../../domain/model/pokemon/pokemon_model.dart';

abstract class FavoritePokemonListState {}

class LoadingFavoritePokemonListState implements FavoritePokemonListState {}

class SuccessFavoritePokemonListState implements FavoritePokemonListState {
  SuccessFavoritePokemonListState(
    this.favoritePokemonList,
  );

  final List<PokemonModel> favoritePokemonList;
}

class ErrorFavoritePokemonListState implements FavoritePokemonListState {
  ErrorFavoritePokemonListState(
    this.exception,
  );

  final Exception exception;
}
