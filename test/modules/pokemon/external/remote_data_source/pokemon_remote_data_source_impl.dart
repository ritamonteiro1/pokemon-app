import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

/*
EM ANDAMENTO
 */
@GenerateMocks([Dio])
void main() {
  // late MockDio mockDio;
  // late PokemonRemoteDataSource pokemonRemoteDataSource;
  // setUpAll(() {
  //   mockDio = MockDio();
  //   pokemonRemoteDataSource = PokemonRemoteDataSourceImpl(dio: mockDio);
  // });
  // setUp(() {
  //   reset(mockDio);
  // });
  // group('GIVEN a call on getPokemonList', () {
  //   const getPokemonListSuccessResponsePath =
  //       'test_resources/get_pokemon_list_success_response.json';
  //   test('THEN verify if correct urls are called', () async {
  //     final json = await getPokemonListSuccessResponsePath.getJsonFromPath();
  //     when(mockDio.get(
  //       any,
  //     )).thenAnswer(
  //       (_) async => _getSuccessfulResponseMock(json),
  //     );
  //     await pokemonRemoteDataSource.getPokemonList();
  //     verify(mockDio.get(
  //       '${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/?limit=15',
  //     )).called(1);
  //   });
  // });
}

Response<dynamic> _getSuccessfulResponseMock(json) => Response(
      data: json,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );
