import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_details/pokemon_details_state.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_details/pokemon_details_store.dart';

void main() {
  late PokemonDetailsStore pokemonDetailsStore;
  setUpAll(() {
    pokemonDetailsStore = PokemonDetailsStore();
  });
  group('GIVEN a call on getPokemonList', () {
    test(
        'WHEN request is successfully THEN it should emits a '
        'InitialPokemonDetailsState', () async {
      await expectLater(pokemonDetailsStore.pokemonDetailsState,
          LoadingPokemonDetailsState());
      await expectLater(pokemonDetailsStore.pokemonDetailsState,
          LoadingPokemonDetailsState());
      await pokemonDetailsStore.startPokemonDetailsScreen();
      await expectLater(pokemonDetailsStore.pokemonDetailsState,
          InitialPokemonDetailsState());
    });
  });
}
