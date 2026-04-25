part of recommanded_tab_view;

import 'package:flutter/material.dart';
import 'package:your_project_name/models/product.dart';

class _RecommandedTabMobile extends StatelessWidget {
  final RecommandedTabViewModel viewModel;
  final List<Product> products;

  const _RecommandedTabMobile({
    Key? key,
    required this.viewModel,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];

          return InkWell(
            onTap: () {
              viewModel.nav(product);
            },
            child: Hero(
              tag: product.position, // ensure this is unique
              child: GridItem(product: product),
            ),
          );
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final Product product;

  const GridItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 4, left: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.imageUrl),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 4),
            child: Text(
              product.productName,
              style: const TextStyle(color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 6.0, left: 4),
            child: Text(
              "\$${product.price}",
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}