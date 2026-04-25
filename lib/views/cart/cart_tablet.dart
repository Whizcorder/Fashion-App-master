import 'package:flutter/material.dart';

class CartViewModel {} // temporary stub (remove if you already have it)

class CartTablet extends StatelessWidget {
  final CartViewModel viewModel;

  const CartTablet(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CartTablet'),
      ),
    );
  }
}