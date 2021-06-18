// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_task_2/providers/viewModels/ProductViewModel.dart';

class ShoppingProvider extends ChangeNotifier {
  static var newName = '';
  static var newCount = '';
  var productsList = [
    // {"id": 0, "name": 'product 1', "count": 26}
  ];
  static var filteredProductsList = [
    // {"id": 0, "name": 'sara', "count": 26}
  ];
  var counter = 0;

  getProductsList() {
    return filteredProductsList;
  }

  addNewProduct() {
    var product = {"id": productsList.length, "name": '', "count": ''};
    productsList.add(product);

    filterProductsByName('');
    notifyListeners();
  }

  editProduct(productId) {
    var editedProduct =
        productsList.firstWhere((element) => element['id'] == productId);
    editedProduct['name'] = newName;
    editedProduct['count'] = newCount;
    newCount = '';
    newName = '';
    notifyListeners();
  }

  filterProductsByName(value) {
    var newList = [];
    if (value == '') {
      newList = productsList;
    } else {
      newList = productsList
          .where((element) => element['name'].toString().indexOf(value) > -1)
          .toList();
    }
    filteredProductsList = newList;
    notifyListeners();
  }

  changeNewName(name) {
    print('new name');
    inspect(name);
    newName = name;
    notifyListeners();
  }

  changeNewCount(count) {
    newCount = count;
    notifyListeners();
  }

  deleteProduct(id) {
    var newList = [];
    newList = productsList
        .where((element) => element['id'].toString() != id.toString())
        .toList();
    ///// TOFIX
    filteredProductsList = newList;
    productsList = newList;
    notifyListeners();
  }
}
