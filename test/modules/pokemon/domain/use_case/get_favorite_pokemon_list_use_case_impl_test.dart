import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_favorite_pokemon_list_use_case.dart';

import 'get_favorite_pokemon_list_use_case_impl_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late MockPokemonRepository mockPokemonRepository;
  late GetFavoritePokemonListUseCase getFavoritePokemonListUseCase;
  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    getFavoritePokemonListUseCase = GetFavoritePokemonListUseCaseImpl(
        pokemonRepository: mockPokemonRepository);
  });
  setUp(() {
    reset(mockPokemonRepository);
  });
  group('GIVEN a call', () {
    test(
        'WHEN request is successfully '
        'THEN it should return a Favorite Pokemon List', () async {
      when(mockPokemonRepository.getFavoritePokemonList()).thenAnswer(
          (_) async => _getSuccessfulFavoritePokemonModelListMock());
      final favoritePokemonList = await getFavoritePokemonListUseCase.call();
      expect(favoritePokemonList, _getSuccessfulFavoritePokemonModelListMock());
      verify(mockPokemonRepository.getFavoritePokemonList());
    });
    test(
        'WHEN request is fail '
        'THEN it should  throw an exception', () async {
      when(mockPokemonRepository.getFavoritePokemonList())
          .thenThrow(Exception());
      expect(() => getFavoritePokemonListUseCase.call(), throwsException);
      verify(mockPokemonRepository.getFavoritePokemonList());
    });
  });
}

List<PokemonModel> _getSuccessfulFavoritePokemonModelListMock() =>
    <PokemonModel>[
      PokemonModel(
        abilityList: const <String>['1', '2'],
        height: 10,
        id: 3,
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
        isFavorite: true,
      ),
      PokemonModel(
        abilityList: const <String>['3', '4'],
        height: 20,
        id: 4,
        name: 'pokemon 2',
        statList: const <StatModel>[
          StatModel(base: 3, name: 'name 3'),
          StatModel(base: 4, name: 'name 4'),
        ],
        typeList: const <String>['1', '2'],
        weight: 20,
        image:
            'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/2.svg',
        colorNameByFirstType: 'colore',
        description: 'description 1',
        isFavorite: true,
      ),
    ];
