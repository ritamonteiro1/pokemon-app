import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/add_favorite_pokemon_use_case.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/remove_favorite_pokemon_use_case.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/verify_if_pokemon_is_favorite_use_case.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_details/pokemon_details_state.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_details/pokemon_details_store.dart';

import 'pokemon_details_store_test.mocks.dart';

@GenerateMocks([
  AddFavoritePokemonUseCase,
  RemoveFavoritePokemonUseCase,
  VerifyIfPokemonIsFavoriteUseCase
])
void main() {
  late PokemonDetailsStore pokemonDetailsStore;
  late MockAddFavoritePokemonUseCase mockAddFavoritePokemonUseCase;
  late MockRemoveFavoritePokemonUseCase mockRemoveFavoritePokemonUseCase;
  late MockVerifyIfPokemonIsFavoriteUseCase
      mockVerifyIfPokemonIsFavoriteUseCase;
  setUpAll(() {
    mockAddFavoritePokemonUseCase = MockAddFavoritePokemonUseCase();
    mockRemoveFavoritePokemonUseCase = MockRemoveFavoritePokemonUseCase();
    mockVerifyIfPokemonIsFavoriteUseCase =
        MockVerifyIfPokemonIsFavoriteUseCase();
    pokemonDetailsStore = PokemonDetailsStore(
        addFavoritePokemonUseCase: mockAddFavoritePokemonUseCase,
        removeFavoritePokemonUseCase: mockRemoveFavoritePokemonUseCase,
        verifyIfPokemonIsFavorite: mockVerifyIfPokemonIsFavoriteUseCase);
  });
  group('GIVEN a call on getPokemonList', () {
    test(
        'WHEN request is successfully THEN it should emits a '
        'InitialPokemonDetailsState', () async {
      when(mockVerifyIfPokemonIsFavoriteUseCase.call(any))
          .thenAnswer((_) async => true);
      await expectLater(pokemonDetailsStore.pokemonDetailsState,
          LoadingPokemonDetailsState());
      await expectLater(pokemonDetailsStore.pokemonDetailsState,
          LoadingPokemonDetailsState());
      await pokemonDetailsStore
          .startPokemonDetailsScreen(_getSuccessfulPokemonModelMock());
      await expectLater(pokemonDetailsStore.pokemonDetailsState,
          InitialPokemonDetailsState(_getSuccessfulPokemonModelMock()));
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
      isFavorite: true,
    );
