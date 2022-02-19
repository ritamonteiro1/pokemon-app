import 'package:flutter/material.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) => const Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: PokedexConstantsColors.primaryColor,
          ),
        ),
      );
}
