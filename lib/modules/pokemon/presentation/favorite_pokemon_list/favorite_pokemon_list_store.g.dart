// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_pokemon_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritePokemonListStore on _FavoritePokemonListStore, Store {
  final _$favoritePokemonListStateAtom =
      Atom(name: '_FavoritePokemonListStore.favoritePokemonListState');

  @override
  FavoritePokemonListState get favoritePokemonListState {
    _$favoritePokemonListStateAtom.reportRead();
    return super.favoritePokemonListState;
  }

  @override
  set favoritePokemonListState(FavoritePokemonListState value) {
    _$favoritePokemonListStateAtom
        .reportWrite(value, super.favoritePokemonListState, () {
      super.favoritePokemonListState = value;
    });
  }

  @override
  String toString() {
    return '''
favoritePokemonListState: ${favoritePokemonListState}
    ''';
  }
}
