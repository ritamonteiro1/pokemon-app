import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokedex_app/generated/l10n.dart';

Widget testableWidget(Widget? child,
        {NavigatorObserver? navigatorObserver,
        GlobalKey<NavigatorState>? navigatorKey}) =>
    MaterialApp(
        home: child,
        navigatorKey: navigatorKey,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ]);
