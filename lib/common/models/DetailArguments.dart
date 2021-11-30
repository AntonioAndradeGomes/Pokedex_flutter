import 'package:pokedex/common/models/Pokemon.dart';

class DatailArguments {
  final Pokemon pokemon;
  final int? index;

  DatailArguments({
    required this.pokemon,
    this.index = 0,
  });
}
