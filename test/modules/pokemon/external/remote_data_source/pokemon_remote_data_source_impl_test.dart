import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_url_api.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokedex/pokedex_response.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokemon/details/pokemon_response.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
import 'package:pokedex_app/modules/pokemon/external/remote_data_source/pokemon_remote_data_source_impl.dart';

import '../../../../utils/json_extensions.dart';
import 'pokemon_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PokemonRemoteDataSource pokemonRemoteDataSource;
  const getPokemonListSuccessResponsePath =
      'test_resources/pokemon_list_success_response.json';
  const getPokemonSuccessResponsePath =
      'test_resources/pokemon_success_response.json';
  const getPokemonSpecieSuccessResponsePath =
      'test_resources/pokemon_specie_success_response.json';
  setUpAll(() {
    mockDio = MockDio();
    pokemonRemoteDataSource = PokemonRemoteDataSourceImpl(dio: mockDio);
  });
  setUp(() {
    reset(mockDio);
  });
  group('GIVEN a call on getPokemonList', () {
    test('THEN verify if correct url is called', () async {
      final jsonPokemonList =
          await getPokemonListSuccessResponsePath.getJsonFromPath();
      final jsonPokemon = await getPokemonSuccessResponsePath.getJsonFromPath();
      final jsonPokemonSpecie =
          await getPokemonSpecieSuccessResponsePath.getJsonFromPath();
      await _mockDioResponsePokemonList(
          mockDio, jsonPokemonList, jsonPokemon, jsonPokemonSpecie);
      await pokemonRemoteDataSource.getPokemonList();
      verify(mockDio.get(
        '${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/?limit=15',
      )).called(1);
    });
    test('THEN status code is 200 THEN it should return a Pokemon Model List',
        () async {
      final jsonPokemonList =
          await getPokemonListSuccessResponsePath.getJsonFromPath();
      final jsonPokemon = await getPokemonSuccessResponsePath.getJsonFromPath();
      final jsonPokemonSpecie =
          await getPokemonSpecieSuccessResponsePath.getJsonFromPath();
      await _mockDioResponsePokemonList(
          mockDio, jsonPokemonList, jsonPokemon, jsonPokemonSpecie);
      final pokemonModelList = await pokemonRemoteDataSource.getPokemonList();
      expect(pokemonModelList, equals(_getSuccessfulPokemonModelListMock()));
    });
  });
  group('GIVEN a call on getPokemonTyped', () {
    test('THEN verify if correct url is called', () async {
      final jsonPokemon = await getPokemonSuccessResponsePath.getJsonFromPath();
      final jsonPokemonSpecie =
          await getPokemonSpecieSuccessResponsePath.getJsonFromPath();
      const typedPokemon = '1';
      await _mockDioResponsePokemonTyped(
          mockDio, typedPokemon, jsonPokemon, jsonPokemonSpecie);
      await pokemonRemoteDataSource.getPokemonTyped(typedPokemon);
      verify(mockDio.get(
        '${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/$typedPokemon',
      )).called(1);
    });
  });
}

List<PokemonModel> _getSuccessfulPokemonModelListMock() => <PokemonModel>[
      PokemonModel(
        abilityList: const <String>['Ability 1', 'Ability 2'],
        height: 7,
        id: 1,
        name: 'Name',
        statList: const <StatModel>[
          StatModel(base: 45, name: 'stat 1'),
          StatModel(base: 49, name: 'stat 2'),
        ],
        typeList: const <String>['Type 1', 'Type 2'],
        weight: 69,
        image:
            'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/1.svg',
        colorNameByFirstType: 'Type 1',
        description: 'description',
      ),
      PokemonModel(
        abilityList: const <String>['Ability 1', 'Ability 2'],
        height: 7,
        id: 1,
        name: 'Name',
        statList: const <StatModel>[
          StatModel(base: 45, name: 'stat 1'),
          StatModel(base: 49, name: 'stat 2'),
        ],
        typeList: const <String>['Type 1', 'Type 2'],
        weight: 69,
        image:
            'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/1.svg',
        colorNameByFirstType: 'Type 1',
        description: 'description',
      ),
    ];

Future<void> _mockDioResponsePokemonTyped(MockDio mockDio, String typedPokemon,
    jsonPokemon, jsonPokemonSpecie) async {
  when(mockDio.get(
    '${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/$typedPokemon',
  )).thenAnswer(
    (_) async => _getSuccessfulResponseMock(jsonPokemon),
  );
  final pokemonDetailsResponse = PokemonResponse.fromJson(jsonPokemon);
  when(mockDio.get(
    pokemonDetailsResponse.specie.url,
  )).thenAnswer(
    (_) async => _getSuccessfulResponseMock(jsonPokemonSpecie),
  );
}

Future<void> _mockDioResponsePokemonList(
    MockDio mockDio, jsonPokemonList, jsonPokemon, jsonPokemonSpecie) async {
  when(mockDio.get('${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/?limit=15'))
      .thenAnswer(
    (_) async => _getSuccessfulResponseMock(jsonPokemonList),
  );
  final pokedexResponse = PokedexResponse.fromJson(jsonPokemonList);
  for (final pokemonUrl in pokedexResponse.pokemonUrlList) {
    when(mockDio.get(pokemonUrl.url)).thenAnswer(
      (_) async => _getSuccessfulResponseMock(jsonPokemon),
    );
    final pokemonDetailsResponse = PokemonResponse.fromJson(jsonPokemon);
    when(mockDio.get(pokemonDetailsResponse.specie.url)).thenAnswer(
      (_) async => _getSuccessfulResponseMock(jsonPokemonSpecie),
    );
  }
}

Response<dynamic> _getSuccessfulResponseMock(json) => Response(
      data: json,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );

DioError _getErrorResponseMock(json, int httpStatusCode) => DioError(
      response: Response(
        data: json,
        statusCode: httpStatusCode,
        requestOptions: RequestOptions(
          path: '',
        ),
      ),
      type: DioErrorType.response,
      requestOptions: RequestOptions(path: ''),
    );
