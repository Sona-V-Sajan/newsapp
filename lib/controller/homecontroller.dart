import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/model/newsmodel.dart';

//when using provider for statemangement firstly add extends for (with changenotifer)
class HomeController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  NewsAppResponse? modelobj;
  bool isLoading = false;

  Future getData({String? searchQuery = "trending"}) async {
    print('Fetching data for: $searchQuery');
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$searchQuery&in&apiKey=bdd9851bed20495885a38139c61f299c');

    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        decodedData = jsonDecode(response.body);
        modelobj = NewsAppResponse.fromJson(decodedData);
        print(response.statusCode);
        print(response.body);
      } else {
        print("Failed to load data:${response.statusCode}");
      }
    } catch (e) {
      print("Error:$e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
