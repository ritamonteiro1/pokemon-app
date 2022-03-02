import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:pokedex_app/generated/l10n.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_key_widgets.dart';
import 'package:pokedex_app/modules/pokemon/module/pokemon_module.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_list/pokemon_list_screen.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_list/pokemon_list_state.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_list/pokemon_list_store.dart';
import 'package:pokedex_app/pokedex_module/pokedex_module.dart';

import '../../../../utils/testable_widget.dart';
import 'pokemon_list_screen_test.mocks.dart';

@GenerateMocks([IModularNavigator, PokemonListStore])
void main() {
  late MockIModularNavigator navigatorMock;
  late MockPokemonListStore mockPokemonListStore;
  setUpAll(() {
    navigatorMock = MockIModularNavigator();
    mockPokemonListStore = MockPokemonListStore();
    S.load(const Locale('pt'));
  });
  setUp(() async {
    initModules([PokedexModule(), PokemonModule()], replaceBinds: []);
    Modular.navigatorDelegate = navigatorMock;
    reset(mockPokemonListStore);
    reset(navigatorMock);
  });
  group('Pokemon List Screen', () {
    testWidgets(
        'WHEN PokemonListScreen stars THEN it should emits Loading State '
        'and it shows LoadingWidget', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(testableWidget(const PokemonListScreen()));
        await tester.pump();
        await tester.pump();
      });
      when(mockPokemonListStore.pokemonListState)
          .thenAnswer((_) => LoadingPokemonListState());
      await expectLater(
          find.byKey(
              const ValueKey(PokemonConstantsKeyWidget.loadingWidgetKey)),
          findsOneWidget);
    });
  });
}
