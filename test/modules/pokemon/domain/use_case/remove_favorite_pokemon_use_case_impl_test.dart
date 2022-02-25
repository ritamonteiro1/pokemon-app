import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/remove_favorite_pokemon_use_case.dart';

import 'remove_favorite_pokemon_use_case_impl_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late MockPokemonRepository mockPokemonRepository;
  late RemoveFavoritePokemonUseCase removeFavoritePokemonUseCase;
  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    removeFavoritePokemonUseCase = RemoveFavoritePokemonUseCaseImpl(
        pokemonRepository: mockPokemonRepository);
  });
  setUp(() {
    reset(mockPokemonRepository);
  });
  group('GIVEN a call', () {
    test(
        'WHEN request is successfully '
        'THEN it should not throw an exception', () async {
      when(mockPokemonRepository
              .removeFavoritePokemon(_getSuccessfulPokemonModelMock()))
          .thenAnswer((_) async => _);
      await removeFavoritePokemonUseCase.call(_getSuccessfulPokemonModelMock());
      expect(Null, Null);
      verify(mockPokemonRepository
          .removeFavoritePokemon(_getSuccessfulPokemonModelMock()));
    });
    test(
        'WHEN request is fail '
        'THEN it should  throw an exception', () async {
      when(mockPokemonRepository
              .removeFavoritePokemon(_getSuccessfulPokemonModelMock()))
          .thenThrow(Exception());
      expect(
          () => removeFavoritePokemonUseCase
              .call(_getSuccessfulPokemonModelMock()),
          throwsException);
      verify(mockPokemonRepository
          .removeFavoritePokemon(_getSuccessfulPokemonModelMock()));
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
