import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_list_use_case.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_typed_use_case.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_list/pokemon_list_state.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_list/pokemon_list_store.dart';

import 'pokemon_list_store_test.mocks.dart';

@GenerateMocks([GetPokemonListUseCase, GetPokemonTypedUseCase])
void main() {
  late MockGetPokemonTypedUseCase mockGetPokemonTypedUseCase;
  late MockGetPokemonListUseCase mockGetPokemonListUseCase;
  late PokemonListStore pokemonListStore;
  setUpAll(() {
    mockGetPokemonTypedUseCase = MockGetPokemonTypedUseCase();
    mockGetPokemonListUseCase = MockGetPokemonListUseCase();
    pokemonListStore = PokemonListStore(
        getPokemonListUseCase: mockGetPokemonListUseCase,
        getPokemonTypedUseCase: mockGetPokemonTypedUseCase);
  });
  setUp(() {
    reset(mockGetPokemonListUseCase);
    reset(mockGetPokemonTypedUseCase);
  });
  group('GIVEN a call on getPokemonList', () {
    test('WHEN request is successfully THEN it should emits a SuccessState',
        () async {
      expect(pokemonListStore.pokemonListState, LoadingPokemonListState());
      expect(pokemonListStore.pokemonListState, LoadingPokemonListState());
      when(mockGetPokemonListUseCase.call())
          .thenAnswer((_) async => _getSuccessfulPokemonModelListMock());
      await pokemonListStore.getPokemonList();
      expect(pokemonListStore.pokemonListState,
          SuccessPokemonListState(_getSuccessfulPokemonModelListMock()));
    });
  });
}

List<PokemonModel> _getSuccessfulPokemonModelListMock() => const <PokemonModel>[
      PokemonModel(
          abilityList: <String>['1', '2'],
          height: 10,
          id: 1,
          name: 'pokemon 1',
          statList: <StatModel>[
            StatModel(base: 1, name: 'name 1'),
            StatModel(base: 2, name: 'name 2'),
          ],
          typeList: <String>['1', '2'],
          weight: 10,
          image:
              'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/1.svg'),
      PokemonModel(
          abilityList: <String>['3', '4'],
          height: 20,
          id: 2,
          name: 'pokemon 2',
          statList: <StatModel>[
            StatModel(base: 3, name: 'name 3'),
            StatModel(base: 4, name: 'name 4'),
          ],
          typeList: <String>['1', '2'],
          weight: 20,
          image:
              'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/2.svg'),
    ];
