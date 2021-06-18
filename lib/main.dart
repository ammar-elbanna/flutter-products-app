import 'package:flutter/material.dart';
import 'package:flutter_task_2/providers/shoppingProvider.dart';
import 'package:flutter_task_2/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: ShoppingProvider(),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Home(title: 'Flutter Demo Home'))
        // home: Payments()),
        );
  }
}
