// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonListStore on _PokemonListStore, Store {
  final _$pokemonListStateAtom =
      Atom(name: '_PokemonListStore.pokemonListState');

  @override
  PokemonListState get pokemonListState {
    _$pokemonListStateAtom.reportRead();
    return super.pokemonListState;
  }

  @override
  set pokemonListState(PokemonListState value) {
    _$pokemonListStateAtom.reportWrite(value, super.pokemonListState, () {
      super.pokemonListState = value;
    });
  }

  final _$isBackgroundDarkAtom =
      Atom(name: '_PokemonListStore.isBackgroundDark');

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

  final _$isEmptyPokemonTextFieldAtom =
      Atom(name: '_PokemonListStore.isEmptyPokemonTextField');

  @override
  bool get isEmptyPokemonTextField {
    _$isEmptyPokemonTextFieldAtom.reportRead();
    return super.isEmptyPokemonTextField;
  }

  @override
  set isEmptyPokemonTextField(bool value) {
    _$isEmptyPokemonTextFieldAtom
        .reportWrite(value, super.isEmptyPokemonTextField, () {
      super.isEmptyPokemonTextField = value;
    });
  }

  final _$getPokemonListAsyncAction =
      AsyncAction('_PokemonListStore.getPokemonList');

  @override
  Future<void> getPokemonList() {
    return _$getPokemonListAsyncAction.run(() => super.getPokemonList());
  }

  final _$getPokemonTypedAsyncAction =
      AsyncAction('_PokemonListStore.getPokemonTyped');

  @override
  Future<void> getPokemonTyped(String pokemonTyped) {
    return _$getPokemonTypedAsyncAction
        .run(() => super.getPokemonTyped(pokemonTyped));
  }

  final _$_PokemonListStoreActionController =
      ActionController(name: '_PokemonListStore');

  @override
  void toggleBackground() {
    final _$actionInfo = _$_PokemonListStoreActionController.startAction(
        name: '_PokemonListStore.toggleBackground');
    try {
      return super.toggleBackground();
    } finally {
      _$_PokemonListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonListState: ${pokemonListState},
isBackgroundDark: ${isBackgroundDark},
isEmptyPokemonTextField: ${isEmptyPokemonTextField}
    ''';
  }
}
