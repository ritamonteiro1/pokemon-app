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
    test(
        'WHEN request is successfully '
        'THEN it should return an Pokemon Model list', () async {
      when(mockPokemonRemoteDataSource.getPokemonList())
          .thenAnswer((_) async => _getSuccessfulPokemonModelListMock());
      final pokemonList = await pokemonRepositoryImpl.getPokemonList();
      expect(pokemonList, _getSuccessfulPokemonModelListMock());
      verify(mockPokemonRemoteDataSource.getPokemonList()).called(1);
    });
    test(
        'WHEN request is fail '
        'THEN it should throw an exception', () async {
      when(mockPokemonRemoteDataSource.getPokemonList()).thenThrow(Exception());
      expect(() => pokemonRepositoryImpl.getPokemonList(), throwsException);
    });
  });
  group('GIVEN a call on getPokemonTyped', () {
    test(
        'WHEN request is successfully '
        'THEN it should return an Pokemon Model', () async {
      when(mockPokemonRemoteDataSource.getPokemonTyped(any))
          .thenAnswer((_) async => _getSuccessfulPokemonModelMock());
      final pokemon = await pokemonRepositoryImpl.getPokemonTyped('pokemon 1');
      expect(pokemon, _getSuccessfulPokemonModelMock());
      verify(mockPokemonRemoteDataSource.getPokemonTyped(any)).called(1);
    });
    test(
        'WHEN request is fail '
        'THEN it should throw an exception', () async {
      when(mockPokemonRemoteDataSource.getPokemonTyped(any))
          .thenThrow(Exception());
      expect(() => pokemonRepositoryImpl.getPokemonTyped('pokemon 1'),
          throwsException);
    });
  });
}

PokemonModel _getSuccessfulPokemonModelMock() => const PokemonModel(
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
        'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/1.svg');

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