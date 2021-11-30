import 'package:flutter/material.dart';
import 'package:pokedex/common/models/Pokemon.dart';
import 'widgets/pokemon_datail_list.dart';
import 'widgets/detail_app_bar.dart';

class DatailPage extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  const DatailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DatailAppBar(
            pokemon: pokemon,
            onBack: onBack,
          ),
          PokemonDatailList(
            pokemon: pokemon,
            list: list,
            controller: controller,
            onChangePokemon: onChangePokemon,
          ),
        ],
      ),
    );
  }
}
