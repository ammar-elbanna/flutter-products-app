import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task_2/providers/shoppingProvider.dart';
import 'package:flutter_task_2/screens/myTableRow.dart';
import 'package:provider/provider.dart';

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productsList = Provider.of<ShoppingProvider>(context).getProductsList();
    inspect(productsList);
    return ListView.builder(
        // padding: const EdgeInsets.all(8),
        itemCount: productsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            margin: EdgeInsets.only(bottom: 20),
            // color: Colors.red[300],
            child: MyTableRow(productsList[index]),
          );
        });
  }
}
