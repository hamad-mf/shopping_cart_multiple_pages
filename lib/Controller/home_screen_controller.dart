import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List categoryList = [];
   getCategories() async {
    final url = Uri.parse("https://fakestoreapi.com/products/categories");

    try {
      var rsp = await http.get(url);
      if (rsp.statusCode == 200) {
        print(rsp.body);

        var convertedjson = jsonDecode(rsp.body);
        categoryList = convertedjson;
        print("list : $categoryList");
      }
    } catch (e) {}
    notifyListeners();
  }
}
