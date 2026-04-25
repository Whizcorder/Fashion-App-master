import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/models/product.model.dart';
import 'package:mvvm_flutter/views/cart/cart_view.dart';
import 'package:mvvm_flutter/views/details/details_view.dart';
import 'package:mvvm_flutter/views/home/home_view.dart';
import 'package:mvvm_flutter/views/login/login_view.dart';

import 'route_name.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings);

    case CartRoute:
      return _getPageRoute(CartView(), settings);

    case LoginRoute:
      return _getPageRoute(LoginView(), settings);

    case DetailsRoute:
      final product = settings.arguments as Product;
      return _getPageRoute(
        DetailsView(product), // ✅ positional constructor fix
        settings,
      );

    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(
    child: child,
    routeName: settings.name ?? '',
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({
    required this.child,
    required this.routeName,
  }) : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (context, animation, secondaryAnimation) {
            return child;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}