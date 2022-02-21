import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/add_favorite_pokemon_use_case.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/remove_favorite_pokemon_use_case.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_details/pokemon_details_state.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_details/pokemon_details_store.dart';

import 'pokemon_details_store_test.mocks.dart';

@GenerateMocks([AddFavoritePokemonUseCase, RemoveFavoritePokemonUseCase])
void main() {
  late PokemonDetailsStore pokemonDetailsStore;
  late MockAddFavoritePokemonUseCase mockAddFavoritePokemonUseCase;
  late MockRemoveFavoritePokemonUseCase mockRemoveFavoritePokemonUseCase;
  setUpAll(() {
    mockAddFavoritePokemonUseCase = MockAddFavoritePokemonUseCase();
    mockRemoveFavoritePokemonUseCase = MockRemoveFavoritePokemonUseCase();
    pokemonDetailsStore = PokemonDetailsStore(
        addFavoritePokemonUseCase: mockAddFavoritePokemonUseCase,
        removeFavoritePokemonUseCase: mockRemoveFavoritePokemonUseCase);
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
