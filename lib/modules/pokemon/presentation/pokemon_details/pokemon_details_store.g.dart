// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailsStore on _PokemonDetailsStore, Store {
  final _$pokemonDetailsStateAtom =
      Atom(name: '_PokemonDetailsStore.pokemonDetailsState');

  @override
  PokemonDetailsState get pokemonDetailsState {
    _$pokemonDetailsStateAtom.reportRead();
    return super.pokemonDetailsState;
  }

  @override
  set pokemonDetailsState(PokemonDetailsState value) {
    _$pokemonDetailsStateAtom.reportWrite(value, super.pokemonDetailsState, () {
      super.pokemonDetailsState = value;
    });
  }

  final _$toggleFavoritePokemonStateAtom =
      Atom(name: '_PokemonDetailsStore.toggleFavoritePokemonState');

  @override
  ToggleFavoritePokemonState get toggleFavoritePokemonState {
    _$toggleFavoritePokemonStateAtom.reportRead();
    return super.toggleFavoritePokemonState;
  }

  @override
  set toggleFavoritePokemonState(ToggleFavoritePokemonState value) {
    _$toggleFavoritePokemonStateAtom
        .reportWrite(value, super.toggleFavoritePokemonState, () {
      super.toggleFavoritePokemonState = value;
    });
  }

  final _$isPokemonFavoriteAtom =
      Atom(name: '_PokemonDetailsStore.isPokemonFavorite');

  @override
  bool? get isPokemonFavorite {
    _$isPokemonFavoriteAtom.reportRead();
    return super.isPokemonFavorite;
  }

  @override
  set isPokemonFavorite(bool? value) {
    _$isPokemonFavoriteAtom.reportWrite(value, super.isPokemonFavorite, () {
      super.isPokemonFavorite = value;
    });
  }

  final _$startPokemonDetailsScreenAsyncAction =
      AsyncAction('_PokemonDetailsStore.startPokemonDetailsScreen');

  @override
  Future<void> startPokemonDetailsScreen(PokemonModel pokemon) {
    return _$startPokemonDetailsScreenAsyncAction
        .run(() => super.startPokemonDetailsScreen(pokemon));
  }

  final _$togglePokemonFavoriteAsyncAction =
      AsyncAction('_PokemonDetailsStore.togglePokemonFavorite');

  @override
  Future<void> togglePokemonFavorite(PokemonModel pokemonModel) {
    return _$togglePokemonFavoriteAsyncAction
        .run(() => super.togglePokemonFavorite(pokemonModel));
  }

  @override
  String toString() {
    return '''
pokemonDetailsState: ${pokemonDetailsState},
toggleFavoritePokemonState: ${toggleFavoritePokemonState},
isPokemonFavorite: ${isPokemonFavorite}
    ''';
  }
}
