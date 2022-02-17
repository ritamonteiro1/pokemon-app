import 'package:dio/dio.dart';

import '../../../constants/pokemon_constants_url_api.dart';
import '../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../domain/exception/network_error_exception.dart';
import '../../../domain/model/pokemon/pokemon_model.dart';
import '../../mapper/remote_to_model.dart';
import '../model/pokedex/pokedex_response.dart';
import '../model/pokemon/details/pokemon_response.dart';
import 'pokemon_remote_data_source.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  PokemonRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  final Dio _dio;
  String? nextPage;

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    final url = _setUrl();
    try {
      final response = await _dio.get(url);
      final pokedexResponse = PokedexResponse.fromJson(response.data);
      nextPage = pokedexResponse.nextUrl;
      final pokemonModelList = <PokemonModel>[];
      pokedexResponse.pokemonUrlList.forEach((pokemonUrl) async {
        final response = await _dio.get(pokemonUrl.url);
        final pokemonResponse = PokemonResponse.fromJson(response.data);
        final pokemonModel = pokemonResponse.toPokemonModel();
        pokemonModelList.add(pokemonModel);
      });
      return pokemonModelList;
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw NetworkErrorException();
      }
    }
  }

  String _setUrl() {
    String url;
    if (nextPage == null) {
      url = '${PokemonConstantsUrlApi.pokemonBaseUrl}${'?limit=15'}';
    } else {
      url = nextPage!;
    }
    return url;
  }
}
