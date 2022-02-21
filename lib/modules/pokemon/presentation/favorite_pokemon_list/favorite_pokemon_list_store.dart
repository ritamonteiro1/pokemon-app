import 'package:mobx/mobx.dart';

import '../../domain/use_case/get_favorite_pokemon_list_use_case.dart';
import 'favorite_pokemon_list_state.dart';

part 'favorite_pokemon_list_store.g.dart';

class FavoritePokemonListStore = _FavoritePokemonListStore
    with _$FavoritePokemonListStore;

abstract class _FavoritePokemonListStore with Store {
  _FavoritePokemonListStore({
    required GetFavoritePokemonListUseCase getFavoritePokemonListUseCase,
  }) : _getFavoritePokemonListUseCase = getFavoritePokemonListUseCase;

  final GetFavoritePokemonListUseCase _getFavoritePokemonListUseCase;

  @observable
  FavoritePokemonListState favoritePokemonListState =
      LoadingFavoritePokemonListState();

  @action
  Future<void> getFavoritePokemonList() async {
    favoritePokemonListState = LoadingFavoritePokemonListState();
    try {
      final favoritePokemonList = await _getFavoritePokemonListUseCase.call();
      favoritePokemonListState =
          SuccessFavoritePokemonListState(favoritePokemonList);
    } on Exception catch (e) {
      favoritePokemonListState = ErrorFavoritePokemonListState(e);
    }
  }
}
