import 'package:flutter/material.dart';
import 'package:pokedex/common/models/DetailArguments.dart';
import 'package:pokedex/common/models/Pokemon.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item.dart';

class HomePage extends StatelessWidget {
  final List<Pokemon> list;
  final Function(String, DatailArguments) onItemTap;

  const HomePage({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: const Text(
            'Pokedex',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list
              .map(
                (e) => PokemonItem(
                  pokemon: e,
                  onTap: onItemTap,
                  index: list.indexOf(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
