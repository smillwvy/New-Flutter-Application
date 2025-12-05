import 'package:flutter/material.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/views/about_screen.dart';
import 'package:sandwich_shop/views/app_routes.dart';
import 'package:sandwich_shop/views/order_screen.dart';
import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/profile_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Keep a single cart instance so items stay in sync across screens.
  final Cart _cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      initialRoute: AppRoutes.order,
      routes: {
        // Main screens share the same cart via constructor injection.
        AppRoutes.order: (context) => OrderScreen(
              cart: _cart,
              maxQuantity: 5,
            ),
        AppRoutes.cart: (context) => CartScreen(cart: _cart),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.about: (context) => const AboutScreen(),
      },
    );
  }
}
