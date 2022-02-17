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

  final _$getPokemonListAsyncAction =
      AsyncAction('_PokemonListStore.getPokemonList');

  @override
  Future<void> getPokemonList() {
    return _$getPokemonListAsyncAction.run(() => super.getPokemonList());
  }

  @override
  String toString() {
    return '''
pokemonListState: ${pokemonListState}
    ''';
  }
}
