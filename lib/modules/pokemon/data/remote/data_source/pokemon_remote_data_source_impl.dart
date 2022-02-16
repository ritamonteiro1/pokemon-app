import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_url_api.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokedex/pokedex_response.dart';
import '../../../domain/model/pokemon/pokemon_model.dart';
import '../../../domain/model/pokemon_details/pokemon_details_model.dart';

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
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw Exception();
      }
    }
    throw UnimplementedError();
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetails(int pokemonId) async {
    throw UnimplementedError();
  }

  String _setUrl() {
    String url;
    if (nextPage == null) {
      url = PokemonConstantsUrlApi.pokemonBaseUrl;
    } else {
      url = nextPage!;
    }
    return url;
  }
}
