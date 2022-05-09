import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../constants/pokemon_colors.dart';

class NotFoundPokemonWidget extends StatelessWidget {
  const NotFoundPokemonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 42,
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).messageAlertOps,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: PokemonColors.grey,
                    fontSize: 148,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.of(context).messageNotFoundPokemon,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: PokemonColors.grey,
                    fontSize: 30,
                  ),
                ),
              ],
            )),
      );
}
