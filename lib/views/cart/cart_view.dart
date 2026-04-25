import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/cart_view_model.dart';
import 'cart_mobile.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late final CartViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CartViewModel();
  }

  void _onMenuPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return CartMobile(viewModel, _onMenuPressed);
  }
}