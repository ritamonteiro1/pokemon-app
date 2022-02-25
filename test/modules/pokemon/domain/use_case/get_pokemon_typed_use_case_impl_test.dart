import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_typed_use_case.dart';

import 'get_pokemon_typed_use_case_impl_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late MockPokemonRepository mockPokemonRepository;
  late GetPokemonTypedUseCase getPokemonTypedUseCase;
  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    getPokemonTypedUseCase =
        GetPokemonTypedUseCaseImpl(pokemonRepository: mockPokemonRepository);
  });
  setUp(() {
    reset(mockPokemonRepository);
  });
  group('GIVEN a call', () {
    test(
        'WHEN request is successfully '
        'THEN it should return a PokemonModel', () async {
      when(mockPokemonRepository.getPokemonTyped(any))
          .thenAnswer((_) async => _getSuccessfulPokemonModelMock());
      final pokemon = await getPokemonTypedUseCase.call('pokemon 1');
      expect(pokemon, _getSuccessfulPokemonModelMock());
      verify(mockPokemonRepository.getPokemonTyped(any));
    });
    test(
        'WHEN request is successfully and id typed pokemon equals 5'
        'THEN it should return a PokemonModel with id equals 5', () async {
      when(mockPokemonRepository.getPokemonTyped(any)).thenAnswer(
          (_) async => _getSuccessfulPokemonModelWithIdEquals5Mock());
      final pokemon = await getPokemonTypedUseCase.call('pokemon 5');
      expect(pokemon.id, 5);
      verify(mockPokemonRepository.getPokemonTyped(any));
    });
    test(
        'WHEN request is fail '
        'THEN it should  throw an exception', () async {
      when(mockPokemonRepository.getPokemonTyped(any)).thenThrow(Exception());
      expect(() => getPokemonTypedUseCase.call('pokemon 1'), throwsException);
      verify(mockPokemonRepository.getPokemonTyped(any));
    });
  });
}

PokemonModel _getSuccessfulPokemonModelWithIdEquals5Mock() => PokemonModel(
      abilityList: const <String>['1', '2'],
      height: 10,
      id: 5,
      name: 'pokemon 5',
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
