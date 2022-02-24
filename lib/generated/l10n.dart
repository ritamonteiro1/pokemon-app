// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ioasys pokédex`
  String get appName {
    return Intl.message(
      'ioasys pokédex',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get pokemonListScreenTextFieldLabelTextSearch {
    return Intl.message(
      'Search',
      name: 'pokemonListScreenTextFieldLabelTextSearch',
      desc: '',
      args: [],
    );
  }

  /// `Search pokemon`
  String get pokemonListScreenTextFieldHintTextSearch {
    return Intl.message(
      'Search pokemon',
      name: 'pokemonListScreenTextFieldHintTextSearch',
      desc: '',
      args: [],
    );
  }

  /// `Connection fail`
  String get messageNetworkError {
    return Intl.message(
      'Connection fail',
      name: 'messageNetworkError',
      desc: '',
      args: [],
    );
  }

  /// `Occurred error`
  String get messageGenericStatusCodeError {
    return Intl.message(
      'Occurred error',
      name: 'messageGenericStatusCodeError',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get messageTryAgain {
    return Intl.message(
      'Try again',
      name: 'messageTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Ops`
  String get messageAlertOps {
    return Intl.message(
      'Ops',
      name: 'messageAlertOps',
      desc: '',
      args: [],
    );
  }

  /// `This pokemon is not here ;(`
  String get messageNotFoundPokemon {
    return Intl.message(
      'This pokemon is not here ;(',
      name: 'messageNotFoundPokemon',
      desc: '',
      args: [],
    );
  }

  /// `My favorites`
  String get favoritePokemonListScreenMyFavoritePokemons {
    return Intl.message(
      'My favorites',
      name: 'favoritePokemonListScreenMyFavoritePokemons',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get favoritePokemonListScreenBackText {
    return Intl.message(
      'Back',
      name: 'favoritePokemonListScreenBackText',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get pokemonDetailsScreenWeightText {
    return Intl.message(
      'Weight',
      name: 'pokemonDetailsScreenWeightText',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get pokemonDetailsScreenHeightText {
    return Intl.message(
      'Height',
      name: 'pokemonDetailsScreenHeightText',
      desc: '',
      args: [],
    );
  }

  /// `Moves`
  String get pokemonDetailsScreenMovesText {
    return Intl.message(
      'Moves',
      name: 'pokemonDetailsScreenMovesText',
      desc: '',
      args: [],
    );
  }

  /// `Base Stats`
  String get pokemonDetailsScreenBaseStatsText {
    return Intl.message(
      'Base Stats',
      name: 'pokemonDetailsScreenBaseStatsText',
      desc: '',
      args: [],
    );
  }

  /// `#`
  String get hashtag {
    return Intl.message(
      '#',
      name: 'hashtag',
      desc: '',
      args: [],
    );
  }

  /// ` / `
  String get slash {
    return Intl.message(
      ' / ',
      name: 'slash',
      desc: '',
      args: [],
    );
  }

  /// ` m`
  String get meterAbbreviation {
    return Intl.message(
      ' m',
      name: 'meterAbbreviation',
      desc: '',
      args: [],
    );
  }

  /// ` kg`
  String get kgAbbreviation {
    return Intl.message(
      ' kg',
      name: 'kgAbbreviation',
      desc: '',
      args: [],
    );
  }

  /// `Empty list. Add your fav pokemons here`
  String get favoritePokemonListScreenEmptyList {
    return Intl.message(
      'Empty list. Add your fav pokemons here',
      name: 'favoritePokemonListScreenEmptyList',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
