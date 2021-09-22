import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hometask_v_3/common/theme.dart';
import 'package:hometask_v_3/models/cart_methods.dart';
import 'package:hometask_v_3/models/catalog_list.dart';
import 'package:hometask_v_3/screens/cart.dart';
import 'package:hometask_v_3/screens/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
