import 'package:mobx/mobx.dart';
import '../../domain/use_case/get_favorite_pokemon_list_use_case.dart';

part 'favorite_pokemon_list_store.g.dart';

class FavoritePokemonListStore = _FavoritePokemonListStore
    with _$FavoritePokemonListStore;

abstract class _FavoritePokemonListStore with Store {
  _FavoritePokemonListStore({
    required GetFavoritePokemonListUseCase getFavoritePokemonListUseCase,
  }) : _getFavoritePokemonListUseCase = getFavoritePokemonListUseCase;

  final GetFavoritePokemonListUseCase _getFavoritePokemonListUseCase;
}
