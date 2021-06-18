import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task_2/providers/shoppingProvider.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatefulWidget {
  String initialNameValue = '';
  String initialCountValue = '';
  bool isEditing = false;
  int productId = 0;

  AddNewProduct(
      {this.initialNameValue,
      this.initialCountValue,
      this.isEditing,
      this.productId})
      : super();
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  void _onClickAddButton(context) {
    if (widget.isEditing == true) {
      Provider.of<ShoppingProvider>(context, listen: false)
          .editProduct(widget.productId);
    } else {
      Provider.of<ShoppingProvider>(context, listen: false).addNewProduct();
    }
    Navigator.pop(context);
  }

  void _onChangeName(context, value) {
    Provider.of<ShoppingProvider>(context, listen: false).changeNewName(value);
  }

  void _onChangeCount(context, value) {
    Provider.of<ShoppingProvider>(context, listen: false).changeNewCount(value);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = new TextEditingController();
    _nameController.text = widget.initialNameValue;
    TextEditingController _countController = new TextEditingController();
    _countController.text = widget.initialCountValue;
    return Scaffold(
        body: (SafeArea(
            child: Column(
      children: [
        Text('Add new Item'),
        Column(
          children: [
            Text('Name:'),
            TextField(
                controller: _nameController,
                onChanged: (value) => _onChangeName(context, value),
                decoration: InputDecoration(border: OutlineInputBorder()))
          ],
        ),
        Column(
          children: [
            Text('Count:'),
            TextField(
                controller: _countController,
                onChanged: (value) => _onChangeCount(context, value),
                decoration: InputDecoration(border: OutlineInputBorder()))
          ],
        ),
        Container(
          child: TextButton(
            child: Text('Save'),
            onPressed: () => _onClickAddButton(context),
          ),
          width: 100,
          height: 50,
          color: Colors.red[200],
        ),
      ],
    ))));
  }
}
