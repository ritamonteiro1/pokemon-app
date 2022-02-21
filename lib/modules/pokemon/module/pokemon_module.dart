import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import '../constants/pokemon_constants_routes.dart';
import '../data/cache/data_source/pokemon_cache_data_source.dart';
import '../data/cache/data_source/pokemon_cache_data_source_impl.dart';
import '../data/remote/data_source/pokemon_remote_data_source.dart';
import '../data/remote/data_source/pokemon_remote_data_source_impl.dart';
import '../data/repository_impl/pokemon_repository_impl.dart';
import '../domain/repository/pokemon_repository.dart';
import '../domain/use_case/add_favorite_pokemon_use_case.dart';
import '../domain/use_case/add_favorite_pokemon_use_case_impl.dart';
import '../domain/use_case/get_favorite_pokemon_list_use_case.dart';
import '../domain/use_case/get_favorite_pokemon_list_use_case_impl.dart';
import '../domain/use_case/get_pokemon_list_use_case.dart';
import '../domain/use_case/get_pokemon_list_use_case_impl.dart';
import '../domain/use_case/get_pokemon_typed_use_case.dart';
import '../domain/use_case/get_pokemon_typed_use_case_impl.dart';
import '../domain/use_case/remove_favorite_pokemon_use_case.dart';
import '../domain/use_case/remove_favorite_pokemon_use_case_impl.dart';
import '../presentation/favorite_pokemon_list/favorite_pokemon_list_screen.dart';
import '../presentation/favorite_pokemon_list/favorite_pokemon_list_store.dart';
import '../presentation/pokemon_details/pokemon_details_screen.dart';
import '../presentation/pokemon_details/pokemon_details_store.dart';
import '../presentation/pokemon_list/pokemon_list_screen.dart';
import '../presentation/pokemon_list/pokemon_list_store.dart';

class PokemonModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => Hive),
        Bind.lazySingleton<PokemonRemoteDataSource>(
            (i) => PokemonRemoteDataSourceImpl(dio: i())),
        Bind.lazySingleton<PokemonCacheDataSource>(
            (i) => PokemonCacheDataSourceImpl(hive: i())),
        Bind.lazySingleton<PokemonRepository>((i) => PokemonRepositoryImpl(
            pokemonRemoteDataSource: i(), pokemonCacheDataSource: i())),
        Bind.lazySingleton<AddFavoritePokemonUseCase>(
            (i) => AddFavoritePokemonUseCaseImpl(pokemonRepository: i())),
        Bind.lazySingleton<RemoveFavoritePokemonUseCase>(
            (i) => RemoveFavoritePokemonUseCaseImpl(pokemonRepository: i())),
        Bind.lazySingleton<GetFavoritePokemonListUseCase>(
            (i) => GetFavoritePokemonListUseCaseImpl(pokemonRepository: i())),
        Bind.lazySingleton<GetPokemonListUseCase>(
            (i) => GetPokemonListUseCaseImpl(pokemonRepository: i())),
        Bind.lazySingleton<GetPokemonTypedUseCase>(
            (i) => GetPokemonTypedUseCaseImpl(pokemonRepository: i())),
        Bind.factory((i) =>
            FavoritePokemonListStore(getFavoritePokemonListUseCase: i())),
        Bind.factory((i) => PokemonListStore(
            getPokemonListUseCase: i(), getPokemonTypedUseCase: i())),
        Bind.factory((i) => PokemonDetailsStore(
            addFavoritePokemonUseCase: i(), removeFavoritePokemonUseCase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          PokemonConstantsRoutes.pokemonListScreen,
          child: (context, args) => const PokemonListScreen(),
        ),
        ChildRoute(
          PokemonConstantsRoutes.pokemonDetailsScreen,
          child: (context, args) => PokemonDetailsScreen(
            pokemon: args.data[0],
            backgroundColor: args.data[1],
          ),
        ),
        ChildRoute(
          PokemonConstantsRoutes.favoritePokemonListScreen,
          child: (context, args) =>
              FavoritePokemonListScreen(backgroundColor: args.data),
        ),
      ];
}
