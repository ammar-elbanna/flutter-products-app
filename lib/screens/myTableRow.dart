import 'package:flutter/material.dart';
import 'package:flutter_task_2/providers/shoppingProvider.dart';
import 'package:flutter_task_2/screens/addNewProduct.dart';
import 'package:provider/provider.dart';

/// This is the stateless widget that the main application instantiates.
class MyTableRow extends StatelessWidget {
  final rowData;
  const MyTableRow(this.rowData) : super();

  _onDeleteProduct(context) {
    Provider.of<ShoppingProvider>(context, listen: false)
        .deleteProduct(rowData['id']);
  }

  void _onClickEditButton(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddNewProduct(
          initialNameValue: rowData['name'],
          initialCountValue: rowData['count'].toString(),
          isEditing: true,
          productId: rowData['id']);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          // color: Colors.amber,
          //height: 60,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.amber,
                  width: 100,
                  child: Text(rowData['name']),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  // color: Colors.red,
                  width: 100,
                  child: Text(rowData['count'].toString()),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.blue[100],
                  width: 100,
                  child: TextButton(
                      child: Text('Edit'),
                      onPressed: () => _onClickEditButton(context)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.green,
                  width: 100,
                  child: TextButton(
                    child: Text('Del'),
                    onPressed: () => _onDeleteProduct(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
      ]),
    );
  }
}
