import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    required this.colorCircularProgressIndicator,
    Key? key,
  }) : super(key: key);
  final Color colorCircularProgressIndicator;

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
          color: colorCircularProgressIndicator,
        ),
      );
}
