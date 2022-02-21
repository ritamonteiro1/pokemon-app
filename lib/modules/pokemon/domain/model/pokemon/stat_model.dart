import 'package:equatable/equatable.dart';

class StatModel extends Equatable {
  const StatModel({
    required this.name,
    required this.base,
  });

  final String name;
  final int base;

  @override
  List<Object?> get props => [
        name,
        base,
      ];
}
