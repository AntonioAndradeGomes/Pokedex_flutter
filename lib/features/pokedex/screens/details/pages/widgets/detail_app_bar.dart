import 'package:flutter/material.dart';
import 'package:pokedex/common/models/Pokemon.dart';

class DatailAppBar extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onBack;
  const DatailAppBar({
    Key? key,
    required this.pokemon,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: pokemon.baseColor,
        leading: IconButton(
          onPressed: onBack,
          icon: Icon(
            Icons.chevron_left,
          ),
        ),
      ),
    );
  }
}
