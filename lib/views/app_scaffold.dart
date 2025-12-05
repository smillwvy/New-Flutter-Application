import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_routes.dart';
import 'package:sandwich_shop/views/app_styles.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final String currentRoute;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.currentRoute,
  });

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pop(context);
    if (routeName == currentRoute) {
      return;
    }
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 32,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                style: heading1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Sandwich Shop',
                    style: heading1,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Navigate around the app',
                    style: normalText,
                  ),
                ],
              ),
            ),
            ListTile(
              key: const Key('drawer_order'),
              leading: const Icon(Icons.fastfood),
              title: const Text('Order'),
              selected: currentRoute == AppRoutes.order,
              onTap: () => _navigateTo(context, AppRoutes.order),
            ),
            ListTile(
              key: const Key('drawer_cart'),
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              selected: currentRoute == AppRoutes.cart,
              onTap: () => _navigateTo(context, AppRoutes.cart),
            ),
            ListTile(
              key: const Key('drawer_profile'),
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              selected: currentRoute == AppRoutes.profile,
              onTap: () => _navigateTo(context, AppRoutes.profile),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
