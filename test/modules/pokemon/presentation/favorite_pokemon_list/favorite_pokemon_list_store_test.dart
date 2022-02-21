import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_favorite_pokemon_list_use_case.dart';
import 'package:pokedex_app/modules/pokemon/presentation/favorite_pokemon_list/favorite_pokemon_list_state.dart';
import 'package:pokedex_app/modules/pokemon/presentation/favorite_pokemon_list/favorite_pokemon_list_store.dart';

import 'favorite_pokemon_list_store_test.mocks.dart';

@GenerateMocks([GetFavoritePokemonListUseCase])
void main() {
  late GetFavoritePokemonListUseCase mockGetFavoritePokemonListUseCase;
  late FavoritePokemonListStore favoritePokemonStore;
  setUpAll(() {
    mockGetFavoritePokemonListUseCase = MockGetFavoritePokemonListUseCase();
  });
  setUp(() {
    reset(mockGetFavoritePokemonListUseCase);
  });
  group('GIVEN a call on getFavoritePokemonList', () {
    test(
        'WHEN request is successfully THEN it should emits a '
        'SuccessFavoritePokemonListState', () async {
      favoritePokemonStore = FavoritePokemonListStore(
          getFavoritePokemonListUseCase: mockGetFavoritePokemonListUseCase);

      await expectLater(favoritePokemonStore.favoritePokemonListState,
          LoadingFavoritePokemonListState());
      await expectLater(favoritePokemonStore.favoritePokemonListState,
          LoadingFavoritePokemonListState());
      when(mockGetFavoritePokemonListUseCase.call()).thenAnswer(
          (_) async => _getSuccessfulFavoritePokemonModelListMock());
      await favoritePokemonStore.getFavoritePokemonList();

      await expectLater(
          favoritePokemonStore.favoritePokemonListState,
          SuccessFavoritePokemonListState(
              _getSuccessfulFavoritePokemonModelListMock()));
    });
  });
}

List<PokemonModel> _getSuccessfulFavoritePokemonModelListMock() =>
    <PokemonModel>[
      PokemonModel(
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
              'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/1.svg'),
      PokemonModel(
          abilityList: const <String>['3', '4'],
          height: 20,
          id: 2,
          name: 'pokemon 2',
          statList: const <StatModel>[
            StatModel(base: 3, name: 'name 3'),
            StatModel(base: 4, name: 'name 4'),
          ],
          typeList: const <String>['1', '2'],
          weight: 20,
          image:
              'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/2.svg'),
    ];
