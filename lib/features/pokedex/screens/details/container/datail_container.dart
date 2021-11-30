import 'package:flutter/material.dart';
import 'package:pokedex/common/error/Failure.dart';
import 'package:pokedex/common/models/DetailArguments.dart';
import 'package:pokedex/common/models/Pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/pokedex_error.dart';
import 'package:pokedex/common/widgets/pokedex_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/datail_page.dart';

class DetailContainer extends StatefulWidget {
  final IPokemonRepository repository;
  final DatailArguments arguments;
  final VoidCallback onBack;

  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  }) : super(key: key);

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  Pokemon? _pokemon;
  late Future<List<Pokemon>> _future;

  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!,
    );
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return PokedexLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if (_pokemon == null) {
            _pokemon = widget.arguments.pokemon;
          }
          return DatailPage(
            pokemon: _pokemon!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangePokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
          );
        }
        if (snapshot.hasError) {
          return PokedexError(
            error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },
    );
  }
}
