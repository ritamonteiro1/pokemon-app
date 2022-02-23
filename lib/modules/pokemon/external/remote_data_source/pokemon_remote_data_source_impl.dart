import 'package:dio/dio.dart';

import '../../constants/pokemon_constants_url_api.dart';
import '../../data/mapper/remote_to_model.dart';
import '../../data/remote/data_source/pokemon_remote_data_source.dart';
import '../../data/remote/model/pokedex/pokedex_response.dart';
import '../../data/remote/model/pokemon/details/pokemon_response.dart';
import '../../data/remote/model/pokemon/specie/specie_response.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/exception/not_found_pokemon_exception.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  PokemonRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

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
      for (final pokemonUrl in pokedexResponse.pokemonUrlList) {
        final pokemonDetailsResponse = await _getPokemonDetails(pokemonUrl.url);
        final pokemonSpecieResponse =
            await _getPokemonSpecie(pokemonDetailsResponse.specie.url);
        final pokemonModel = convertToPokemonModelList(
            pokemonDetailsResponse, pokemonSpecieResponse);
        pokemonModelList.add(pokemonModel);
      }
      return pokemonModelList;
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw NetworkErrorException();
      }
    }
  }

  @override
  Future<PokemonModel> getPokemonTyped(String typedPokemon) async {
    try {
      final response = await _dio
          .get('${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/$typedPokemon');
      final pokemonDetailsResponse = PokemonResponse.fromJson(response.data);
      final pokemonSpecieResponse =
          await _getPokemonSpecie(pokemonDetailsResponse.specie.url);
      final pokemonModel = convertToPokemonModelList(
          pokemonDetailsResponse, pokemonSpecieResponse);
      return pokemonModel;
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        if (dioError.response?.statusCode == 404) {
          throw NotFoundPokemonException();
        }
        throw GenericErrorStatusCodeException();
      } else {
        throw NetworkErrorException();
      }
    }
  }

  Future<SpecieResponse> _getPokemonSpecie(String pokemonSpecieUrl) async {
    final response = await _dio.get(pokemonSpecieUrl);
    return SpecieResponse.fromJson(response.data);
  }

  Future<PokemonResponse> _getPokemonDetails(String pokemonDetailsUrl) async {
    final response = await _dio.get(pokemonDetailsUrl);
    return PokemonResponse.fromJson(response.data);
  }

  String _setUrl() {
    String url;
    if (nextPage == null) {
      url = '${PokemonConstantsUrlApi.pokemonBaseUrl}pokemon/?limit=15';
    } else {
      url = nextPage!;
    }
    return url;
  }
}
