import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/config/api_urls.dart';
import 'package:food_recipe_app/config/apikey.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipe_app/models/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> _recipesList = [];
  String _error = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String get error => _error;

  List<Recipe> get recipesList => _recipesList;

  Future<void> setLoading(bool status) async {
    _isLoading = status;
    // notifyListeners();
  }

  Future<void> searchRecipe(String query) async {
    _error = '';
    // notifyListeners();
    try {
      final response = await http.get(
        Uri.parse('$searchRecipes?query=$query&apiKey=$apikey'),
        // headers: {
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
      );
      // print(response.body[0]);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        for (var item in data) {
          _recipesList.add(Recipe.fromJson(item));
          notifyListeners();
        }
      } else {
        // print(data['message']);
        _error = data['message'];
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
