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

  final _$isBackgroundDarkAtom =
      Atom(name: '_FavoritePokemonListStore.isBackgroundDark');

  @override
  bool get isBackgroundDark {
    _$isBackgroundDarkAtom.reportRead();
    return super.isBackgroundDark;
  }

  @override
  set isBackgroundDark(bool value) {
    _$isBackgroundDarkAtom.reportWrite(value, super.isBackgroundDark, () {
      super.isBackgroundDark = value;
    });
  }

  final _$getFavoritePokemonListAsyncAction =
      AsyncAction('_FavoritePokemonListStore.getFavoritePokemonList');

  @override
  Future<void> getFavoritePokemonList() {
    return _$getFavoritePokemonListAsyncAction
        .run(() => super.getFavoritePokemonList());
  }

  final _$_FavoritePokemonListStoreActionController =
      ActionController(name: '_FavoritePokemonListStore');

  @override
  void toggleBackground() {
    final _$actionInfo = _$_FavoritePokemonListStoreActionController
        .startAction(name: '_FavoritePokemonListStore.toggleBackground');
    try {
      return super.toggleBackground();
    } finally {
      _$_FavoritePokemonListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritePokemonListState: ${favoritePokemonListState},
isBackgroundDark: ${isBackgroundDark}
    ''';
  }
}
