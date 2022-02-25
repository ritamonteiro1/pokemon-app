abstract class ToggleFavoritePokemonState {}

class NoToggleYet implements ToggleFavoritePokemonState {}

class SuccessfullyAddFavoritePokemon implements ToggleFavoritePokemonState {
  SuccessfullyAddFavoritePokemon({
    this.message = 'Pokemon adicionado a lista de favoritos!',
  });

  final String message;
}

class SuccessfullyRemoveFavoritePokemon implements ToggleFavoritePokemonState {
  SuccessfullyRemoveFavoritePokemon({
    this.message = 'Pokemon removido a lista de favoritos!',
  });

  final String message;
}

class FailToggleFavoritePokemon implements ToggleFavoritePokemonState {
  FailToggleFavoritePokemon({
    this.message = 'Ocorreu um erro!',
  });

  final String message;
}
