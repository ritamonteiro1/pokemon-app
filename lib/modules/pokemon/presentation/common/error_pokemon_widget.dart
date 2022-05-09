import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../constants/pokemon_colors.dart';

class ErrorPokemonWidget extends StatelessWidget {
  const ErrorPokemonWidget({
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
                color: PokemonColors.grey,
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
