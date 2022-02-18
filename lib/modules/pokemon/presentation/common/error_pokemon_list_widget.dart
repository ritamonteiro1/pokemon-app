import 'package:flutter/material.dart';
import 'package:pokedex_app/generated/l10n.dart';
import '../../constants/pokemon_constants_colors.dart';

class ErrorPokemonListWidget extends StatelessWidget {
  const ErrorPokemonListWidget({
    required this.message,
    required this.tryAgain,
    Key? key,
  }) : super(key: key);
  final String message;
  final Function() tryAgain;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 42,
        ),
        child: Column(
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: PokemonConstantsColors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: tryAgain,
              child: Text(
                S.of(context).messageTryAgain,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
}
