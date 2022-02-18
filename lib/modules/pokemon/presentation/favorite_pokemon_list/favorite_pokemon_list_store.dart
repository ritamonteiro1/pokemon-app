import 'package:mobx/mobx.dart';
part 'favorite_pokemon_list_store.g.dart';

class FavoritePokemonListState = _FavoritePokemonListState
    with _$FavoritePokemonListState;

abstract class _FavoritePokemonListState with Store {}
