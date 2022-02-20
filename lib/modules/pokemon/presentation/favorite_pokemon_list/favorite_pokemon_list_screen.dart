import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class FavoritePokemonListScreen extends StatefulWidget {
  const FavoritePokemonListScreen({Key? key}) : super(key: key);

  @override
  _FavoritePokemonListScreenState createState() =>
      _FavoritePokemonListScreenState();
}

class _FavoritePokemonListScreenState extends State<FavoritePokemonListScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            S.of(context).favoritePokemonListScreenText,
          ),
        ),
      );
}
