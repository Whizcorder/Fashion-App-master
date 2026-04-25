import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

// Ensure these imports match your actual folder structure in /lib/
import 'package:fashion_app/view_models/details_view_model.dart';
import 'package:fashion_app/models/product.dart';
import 'package:fashion_app/widgets/cart_count_widget.dart';

class DetailsMobile extends StatelessWidget {
  final DetailsViewModel viewModel;
  final Product product;

  const DetailsMobile(this.viewModel, this.product, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// IMAGE SWIPER
          SizedBox(
            height: size.height * 0.44,
            width: size.width,
            child: Hero(
              tag: product.position,
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Center(child: Icon(Icons.broken_image)),
                  );
                },
                itemCount: 1, 
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
          ),

          /// TOP BAR
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: viewModel.navigateBack,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const CartCountWidget(),
              ],
            ),
          ),

          /// DETAILS PANEL
          Positioned(
            top: size.height * 0.43,
            child: Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Lorem Ipsum description here...",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// BOTTOM BAR
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}