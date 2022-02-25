import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/verify_if_pokemon_is_favorite_use_case.dart';

import 'verify_if_pokemon_is_favorite_use_case_impl_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late MockPokemonRepository mockPokemonRepository;
  late VerifyIfPokemonIsFavoriteUseCase verifyIfPokemonIsFavoriteUseCase;
  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    verifyIfPokemonIsFavoriteUseCase = VerifyIfPokemonIsFavoriteUseCaseImpl(
        pokemonRepository: mockPokemonRepository);
  });
  setUp(() {
    reset(mockPokemonRepository);
  });
  group('GIVEN a call', () {
    test(
        'WHEN request is successfully and pokemon is favorite'
        'THEN it should return true', () async {
      when(mockPokemonRepository
              .verifyIfPokemonIsFavorite(_getSuccessfulPokemonModelMock()))
          .thenAnswer((_) async => true);
      final isFavorite = await verifyIfPokemonIsFavoriteUseCase
          .call(_getSuccessfulPokemonModelMock());
      expect(isFavorite, true);
      verify(mockPokemonRepository
          .verifyIfPokemonIsFavorite(_getSuccessfulPokemonModelMock()));
    });
    test(
        'WHEN request is successfully and pokemon is not favorite'
        'THEN it should return false', () async {
      when(mockPokemonRepository
              .verifyIfPokemonIsFavorite(_getSuccessfulPokemonModelMock()))
          .thenAnswer((_) async => false);
      final isFavorite = await verifyIfPokemonIsFavoriteUseCase
          .call(_getSuccessfulPokemonModelMock());
      expect(isFavorite, false);
      verify(mockPokemonRepository
          .verifyIfPokemonIsFavorite(_getSuccessfulPokemonModelMock()));
    });
    test(
        'WHEN request is fail '
        'THEN it should  throw an exception', () async {
      when(mockPokemonRepository
              .verifyIfPokemonIsFavorite(_getSuccessfulPokemonModelMock()))
          .thenThrow(Exception());
      expect(
          () => verifyIfPokemonIsFavoriteUseCase
              .call(_getSuccessfulPokemonModelMock()),
          throwsException);
      verify(mockPokemonRepository
          .verifyIfPokemonIsFavorite(_getSuccessfulPokemonModelMock()));
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
