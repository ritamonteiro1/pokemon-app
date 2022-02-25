// Mocks generated by Mockito 5.1.0 from annotations
// in pokedex_app/test/modules/pokemon/domain/use_case/verify_if_pokemon_is_favorite_use_case_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart'
    as _i2;
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakePokemonModel_0 extends _i1.Fake implements _i2.PokemonModel {}

/// A class which mocks [PokemonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRepository extends _i1.Mock implements _i3.PokemonRepository {
  MockPokemonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.PokemonModel>> getPokemonList() =>
      (super.noSuchMethod(Invocation.method(#getPokemonList, []),
              returnValue:
                  Future<List<_i2.PokemonModel>>.value(<_i2.PokemonModel>[]))
          as _i4.Future<List<_i2.PokemonModel>>);
  @override
  _i4.Future<_i2.PokemonModel> getPokemonTyped(String? typedPokemon) =>
      (super.noSuchMethod(Invocation.method(#getPokemonTyped, [typedPokemon]),
              returnValue:
                  Future<_i2.PokemonModel>.value(_FakePokemonModel_0()))
          as _i4.Future<_i2.PokemonModel>);
  @override
  _i4.Future<void> addFavoritePokemon(_i2.PokemonModel? pokemonModel) => (super
      .noSuchMethod(Invocation.method(#addFavoritePokemon, [pokemonModel]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> removeFavoritePokemon(_i2.PokemonModel? pokemonModel) =>
      (super.noSuchMethod(
          Invocation.method(#removeFavoritePokemon, [pokemonModel]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<List<_i2.PokemonModel>> getFavoritePokemonList() =>
      (super.noSuchMethod(Invocation.method(#getFavoritePokemonList, []),
              returnValue:
                  Future<List<_i2.PokemonModel>>.value(<_i2.PokemonModel>[]))
          as _i4.Future<List<_i2.PokemonModel>>);
  @override
  _i4.Future<bool> verifyIfPokemonIsFavorite(_i2.PokemonModel? pokemonModel) =>
      (super.noSuchMethod(
          Invocation.method(#verifyIfPokemonIsFavorite, [pokemonModel]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
