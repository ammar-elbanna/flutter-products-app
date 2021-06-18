import 'package:flutter/material.dart';
import 'package:flutter_task_2/providers/shoppingProvider.dart';
import 'package:flutter_task_2/screens/addNewProduct.dart';
import 'package:flutter_task_2/screens/myTable.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  void _onClickAddButton(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddNewProduct();
    }));
  }

  _onSearch(context, value) {
    Provider.of<ShoppingProvider>(context, listen: false)
        .filterProductsByName(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Shopping list', textAlign: TextAlign.left),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  child: TextField(
                      onChanged: (value) => _onSearch(context, value),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Search...')),
                )
              ],
            ),
          ),
          ///// table
          SingleChildScrollView(
            child: Container(
              color: Colors.red[50],
              height: 300,
              child: Padding(
                child: MyTable(),
                padding: EdgeInsets.all(15),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //// add button
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: TextButton(
                    child: Text('Add new item'),
                    onPressed: () => _onClickAddButton(context),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
