import 'package:flutter/material.dart';
import '../../constants/pokemon_constants_colors.dart';

class ErrorPokemonListWidget extends StatelessWidget {
  const ErrorPokemonListWidget({
    required this.message,
    Key? key,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 42,
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: PokemonConstantsColors.grey,
          ),
        ),
      );
}
