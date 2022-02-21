import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/modules/pokemon/data/repository_impl/pokemon_repository_impl.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';

import 'pokemon_repository_impl_test.mocks.dart';

@GenerateMocks([PokemonRemoteDataSource])
void main() {
  late MockPokemonRemoteDataSource mockPokemonRemoteDataSource;
  late PokemonRepository pokemonRepositoryImpl;
  setUpAll(() {
    mockPokemonRemoteDataSource = MockPokemonRemoteDataSource();
    pokemonRepositoryImpl = PokemonRepositoryImpl(
        pokemonRemoteDataSource: mockPokemonRemoteDataSource);
  });
  setUp(() {
    reset(mockPokemonRemoteDataSource);
  });
  group('GIVEN a call on getPokemonList', () {
    // test(
    //     'WHEN request is successfully '
    //     'THEN it should return an Pokemon Model list', () async {
    //   when(mockPokemonRemoteDataSource.getPokemonList())
    //       .thenAnswer((_) async => _getSuccessfulPokemonModelMock());
    //   final pokemonList = await pokemonRepositoryImpl.getPokemonList();
    //   expect(pokemonList, matcher);
    //
    // });
  });
}

List<PokemonModel> _getSuccessfulPokemonModelMock() => <PokemonModel>[
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
          abilityList: <String>['1', '2'],
          height: 10,
          id: 2,
          name: 'pokemon 1',
          statList: <StatModel>[
            StatModel(base: 1, name: 'name 1'),
            StatModel(base: 2, name: 'name 2'),
          ],
          typeList: <String>['1', '2'],
          weight: 10,
          image:
              'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/2.svg'),
    ];
