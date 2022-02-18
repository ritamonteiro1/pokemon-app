import 'package:flutter/material.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) => Center(
        child: Text(widget.pokemon.name),
      );
}
