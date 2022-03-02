import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:pokedex_app/generated/l10n.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_key_widgets.dart';
import 'package:pokedex_app/modules/pokemon/domain/exception/generic_error_status_code_exception.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/stat_model.dart';
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
    reset(mockPokemonListStore);
    reset(navigatorMock);
    initModules([PokedexModule(), PokemonModule()], replaceBinds: []);
    Modular.navigatorDelegate = navigatorMock;
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
    testWidgets(
        'WHEN after PokemonListScreen stars and request is successfully '
        'THEN it should emits Success State and it shows PokemonListWidget',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(testableWidget(const PokemonListScreen()));
        await tester.pump();
        await tester.pump();
        await tester.pump();
      });
      when(mockPokemonListStore.pokemonListState).thenAnswer(
          (_) => SuccessPokemonListState(_getSuccessfulPokemonModelListMock()));
      await expectLater(
          find.byKey(
              const ValueKey(PokemonConstantsKeyWidget.pokemonListWidgetKey)),
          findsOneWidget);
    });
    testWidgets(
        'WHEN after PokemonListScreen stars and request is fail because of '
        'GenericErrorStatusCodeException THEN it should emits Error State '
        'and it shows ErrorPokemonWidget', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(testableWidget(const PokemonListScreen()));
        await tester.pump();
        await tester.pump();
        await tester.pump();
      });
      when(mockPokemonListStore.pokemonListState).thenAnswer(
          (_) => ErrorPokemonListState(GenericErrorStatusCodeException()));
      await expectLater(
          find.byKey(
              const ValueKey(PokemonConstantsKeyWidget.errorPokemonWidgetKey)),
          findsOneWidget);
    });
  });
}

List<PokemonModel> _getSuccessfulPokemonModelListMock() => <PokemonModel>[
      PokemonModel(
        abilityList: const <String>['Ability 1', 'Ability 2'],
        height: 7,
        id: 1,
        name: 'Name 1',
        statList: const <StatModel>[
          StatModel(base: 45, name: 'stat 1'),
          StatModel(base: 49, name: 'stat 2'),
        ],
        typeList: const <String>['Type 1', 'Type 2'],
        weight: 69,
        image:
            'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/1.svg',
        colorNameByFirstType: 'Type 1',
        description: 'description',
      ),
      PokemonModel(
        abilityList: const <String>['Ability 1', 'Ability 2'],
        height: 7,
        id: 2,
        name: 'Name 2',
        statList: const <StatModel>[
          StatModel(base: 45, name: 'stat 1'),
          StatModel(base: 49, name: 'stat 2'),
        ],
        typeList: const <String>['Type 1', 'Type 2'],
        weight: 69,
        image:
            'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/2.svg',
        colorNameByFirstType: 'Type 1',
        description: 'description',
      ),
    ];
