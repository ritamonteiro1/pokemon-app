import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/add_favorite_pokemon_use_case.dart';

import 'add_favorite_pokemon_use_case_impl_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late MockPokemonRepository mockPokemonRepository;
  late AddFavoritePokemonUseCase addFavoritePokemonUseCase;
  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    addFavoritePokemonUseCase =
        AddFavoritePokemonUseCaseImpl(pokemonRepository: mockPokemonRepository);
  });
  setUp(() {
    reset(mockPokemonRepository);
  });
  group('GIVEN a call', () {
    test(
        'WHEN request is successfully '
        'THEN it should not throw an exception', () async {
      when(mockPokemonRepository
              .addFavoritePokemon(_getSuccessfulPokemonModelMock()))
          .thenAnswer((_) async => _);
      await addFavoritePokemonUseCase.call(_getSuccessfulPokemonModelMock());
      expect(Null, Null);
      verify(mockPokemonRepository
          .addFavoritePokemon(_getSuccessfulPokemonModelMock()));
    });
    test(
        'WHEN request is fail '
        'THEN it should  throw an exception', () async {
      when(mockPokemonRepository
              .addFavoritePokemon(_getSuccessfulPokemonModelMock()))
          .thenThrow(Exception());
      expect(
          () =>
              addFavoritePokemonUseCase.call(_getSuccessfulPokemonModelMock()),
          throwsException);
      verify(mockPokemonRepository
          .addFavoritePokemon(_getSuccessfulPokemonModelMock()));
    });
  });
}

PokemonModel _getSuccessfulPokemonModelMock() => PokemonModel(
      abilityList: const <String>['1', '2'],
      height: 10,
      id: 1,
      name: 'pokemon 1',
      statList: const <StatModel>[
        StatModel(base: 1, name: 'name 1'),
        StatModel(base: 2, name: 'name 2'),
      ],
      typeList: const <String>['1', '2'],
      weight: 10,
      image:
          'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/1.svg',
      colorNameByFirstType: 'color',
      description: 'description 1',
    );
