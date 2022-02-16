import 'package:dio/dio.dart';

import 'pokemon_remote_data_source.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  PokemonRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;
}
