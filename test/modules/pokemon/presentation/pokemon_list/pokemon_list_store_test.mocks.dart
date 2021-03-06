// Mocks generated by Mockito 5.1.0 from annotations
// in pokedex_app/test/modules/pokemon/presentation/pokemon_list/pokemon_list_store_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart'
    as _i2;
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_list_use_case.dart'
    as _i3;
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_typed_use_case.dart'
    as _i5;

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

/// A class which mocks [GetPokemonListUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPokemonListUseCase extends _i1.Mock
    implements _i3.GetPokemonListUseCase {
  MockGetPokemonListUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.PokemonModel>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue:
                  Future<List<_i2.PokemonModel>>.value(<_i2.PokemonModel>[]))
          as _i4.Future<List<_i2.PokemonModel>>);
}

/// A class which mocks [GetPokemonTypedUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPokemonTypedUseCase extends _i1.Mock
    implements _i5.GetPokemonTypedUseCase {
  MockGetPokemonTypedUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.PokemonModel> call(String? typedPokemon) =>
      (super.noSuchMethod(Invocation.method(#call, [typedPokemon]),
              returnValue:
                  Future<_i2.PokemonModel>.value(_FakePokemonModel_0()))
          as _i4.Future<_i2.PokemonModel>);
}
