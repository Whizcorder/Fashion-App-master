library recommanded_tab_view;

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'recommanded_tab_view_model.dart';
import '../../models/product.dart';

part 'recommanded_tab_desktop.dart';
part 'recommanded_tab_mobile.dart';
part 'recommanded_tab_tablet.dart';

class RecommandedTabView extends StatelessWidget {
  const RecommandedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final RecommandedTabViewModel viewModel = RecommandedTabViewModel();

    final List<Product> products = viewModel.products;

    return ScreenTypeLayout.builder(
      mobile: (_) => _RecommandedTabMobile(
        viewModel: viewModel,
        products: products,
      ),
      tablet: (_) => _RecommandedTabTablet(
        viewModel: viewModel,
        products: products,
      ),
      desktop: (_) => _RecommandedTabDesktop(
        viewModel: viewModel,
        products: products,
      ),
    );
  }
}