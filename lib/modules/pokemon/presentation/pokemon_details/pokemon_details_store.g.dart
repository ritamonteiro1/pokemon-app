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

  final _$addFavoritePokemonSuccessfullyAtom =
      Atom(name: '_PokemonDetailsStore.addFavoritePokemonSuccessfully');

  @override
  bool? get addFavoritePokemonSuccessfully {
    _$addFavoritePokemonSuccessfullyAtom.reportRead();
    return super.addFavoritePokemonSuccessfully;
  }

  @override
  set addFavoritePokemonSuccessfully(bool? value) {
    _$addFavoritePokemonSuccessfullyAtom
        .reportWrite(value, super.addFavoritePokemonSuccessfully, () {
      super.addFavoritePokemonSuccessfully = value;
    });
  }

  final _$removeFavoritePokemonSuccessfullyAtom =
      Atom(name: '_PokemonDetailsStore.removeFavoritePokemonSuccessfully');

  @override
  bool? get removeFavoritePokemonSuccessfully {
    _$removeFavoritePokemonSuccessfullyAtom.reportRead();
    return super.removeFavoritePokemonSuccessfully;
  }

  @override
  set removeFavoritePokemonSuccessfully(bool? value) {
    _$removeFavoritePokemonSuccessfullyAtom
        .reportWrite(value, super.removeFavoritePokemonSuccessfully, () {
      super.removeFavoritePokemonSuccessfully = value;
    });
  }

  final _$startPokemonDetailsScreenAsyncAction =
      AsyncAction('_PokemonDetailsStore.startPokemonDetailsScreen');

  @override
  Future<void> startPokemonDetailsScreen() {
    return _$startPokemonDetailsScreenAsyncAction
        .run(() => super.startPokemonDetailsScreen());
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
addFavoritePokemonSuccessfully: ${addFavoritePokemonSuccessfully},
removeFavoritePokemonSuccessfully: ${removeFavoritePokemonSuccessfully}
    ''';
  }
}
