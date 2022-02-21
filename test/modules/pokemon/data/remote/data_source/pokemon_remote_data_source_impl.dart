import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source_impl.dart';

import 'pokemon_remote_data_source_impl.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PokemonRemoteDataSource pokemonRemoteDataSource;
  setUpAll(() {
    mockDio = MockDio();
    pokemonRemoteDataSource = PokemonRemoteDataSourceImpl(dio: mockDio);
  });
  setUp(() {
    reset(mockDio);
  });
  group('GIVEN a call on getPokemonList', () {
    const getEnterpriseListSuccessResponsePath =
        'test_resources/get_enterprise_list_success_response.json';
    test('THEN verify if correct url is called', () async {});
  });
}
