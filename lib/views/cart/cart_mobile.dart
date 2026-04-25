import 'package:flutter/material.dart';
import '../../viewmodels/cart_view_model.dart'; // ✅ FIXED

class CartMobile extends StatefulWidget {
  final CartViewModel viewModel;
  final VoidCallback onMenuPressed;

  const CartMobile(
    this.viewModel,
    this.onMenuPressed, {
    Key? key,
  }) : super(key: key);

  @override
  State<CartMobile> createState() => _CartMobileState();
}

class _CartMobileState extends State<CartMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: widget.onMenuPressed,
          icon: const Icon(Icons.menu, color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(
          'Cart Items: ${widget.viewModel.items.length}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}