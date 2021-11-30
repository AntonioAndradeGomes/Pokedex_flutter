import 'package:flutter/material.dart';

class PokedexLoading extends StatelessWidget {
  const PokedexLoading({
    Key? key,
    this.error,
  }) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Erro durante a operacao'),
      ),
    );
  }
}
