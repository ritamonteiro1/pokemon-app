import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_url_api.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/modules/pokemon/external/remote_data_source/pokemon_remote_data_source_impl.dart';

import '../../../../utils/json_extensions.dart';
import 'pokemon_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PokemonRemoteDataSource pokemonRemoteDataSource;
  const getPokemonListSuccessResponsePath =
      'test_resources/get_pokemon_list_success_response.json';
  const getPokemonDetailsSuccessResponsePath =
      'test_resources/get_pokemon_details_success_response.json';
  const getSpeciePokemonSuccessResponsePath =
      'test_resources/get_specie_pokemon_success_response.json';
  setUpAll(() {
    mockDio = MockDio();
    pokemonRemoteDataSource = PokemonRemoteDataSourceImpl(dio: mockDio);
  });
  setUp(() {
    reset(mockDio);
  });
  group('GIVEN a call on getPokemonList', () {
    test('THEN verify if correct urls are called', () async {
      final jsonPokemonList =
          await getPokemonListSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(
        any,
      )).thenAnswer(
        (_) async => _getSuccessfulResponseMock(jsonPokemonList),
      );
      await pokemonRemoteDataSource.getPokemonList();
      verify(mockDio.get(
        '${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/?limit=15',
      )).called(1);
    });
  });
  group('GIVEN a call on getPokemonTyped', () {
    test('THEN verify if correct url of pokemon details is called', () async {
      const typedPokemon = '1';
      final jsonPokemonDetails =
          await getPokemonDetailsSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(
        any,
      )).thenAnswer(
        (_) async => _getSuccessfulResponseMock(jsonPokemonDetails),
      );
      await pokemonRemoteDataSource.getPokemonTyped(typedPokemon);
      verify(mockDio.get(
        '${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/$typedPokemon',
      )).called(1);
    });
  });
}

Response<dynamic> _getSuccessfulResponseMock(json) => Response(
      data: json,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );
