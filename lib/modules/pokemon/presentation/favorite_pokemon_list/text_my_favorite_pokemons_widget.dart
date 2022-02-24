import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';

class TextMyFavoritePokemonsWidget extends StatelessWidget {
  const TextMyFavoritePokemonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                PokemonConstantsImages.heart,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              S.of(context).favoritePokemonListScreenMyFavoritePokemons,
              style: const TextStyle(
                color: PokedexConstantsColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
}
