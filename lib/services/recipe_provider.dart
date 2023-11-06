import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/config/api_urls.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipe_app/models/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipes> _recipesList = [];
  List<Recipes> _similarRecipesList = [];
  List<Recipes> _searchrecipesList = [];

  String _error = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSearchLoading = false;
  bool get isSearchLoading => _isSearchLoading;

  String get error => _error;

  List<Recipes> get recipesList => _recipesList;
  List<Recipes> get similarRecipeList => _similarRecipesList;
  List<Recipes> get searchrecipesList => _searchrecipesList;

  Map<String, dynamic> _recipeInfo = {};

  Map<String, dynamic> get recipeInfo => _recipeInfo;

  Future<void> setLoading(bool status) async {
    _isLoading = status;
    // notifyListeners();
  }

  Future<void> searchSetLoading(bool status) async {
    _isSearchLoading = status;
    notifyListeners();
  }

  // search recipes

  Future<void> searchRecipe(String query, String token) async {
    _error = '';
    _searchrecipesList = [];
    // notifyListeners();
    try {
      final response = await http.get(
        Uri.parse('$searchRecipes/$query'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        for (var item in data['data']['results']) {
          _searchrecipesList.add(Recipes.fromJson(item));
          notifyListeners();
        }
      } else {
        _error = data['message'];
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

// get similar recipes
  Future<void> getSimilarRecipes(String id, String token) async {
    _error = '';
    _similarRecipesList = [];
    // notifyListeners();
    try {
      final response = await http.get(
        Uri.parse('$recipeSimilarUrl/$id/similar'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );
      final data = json.decode(response.body);
      print(data);
      if (response.statusCode == 200) {
        for (var item in data) {
          _similarRecipesList.add(Recipes.fromJson(item));
          notifyListeners();
        }
      } else {
        _error = data['message'];
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // get random recipes
  Future<void> getRandomRecipes(String token, String number) async {
    _error = '';
    try {
      final response = await http.get(
        Uri.parse('$randomRecipesUrl/$number'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        for (var item in data['data']['element']) {
          _recipesList.add(Recipes.fromJson(item));
          // print(_rec)
          notifyListeners();
        }
      } else {
        _error = data['message'];
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // get recipe info recipes
  Future<void> getRecipeFullInfo(String id, String token) async {
    _error = '';
    // notifyListeners();
    try {
      final response = await http.get(
        Uri.parse('$recipeInfoUrl/$id/information'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      final Map<String, dynamic> data = json.decode(response.body);
      // print(data['data']);
      if (response.statusCode == 200) {
        _recipeInfo = data['data'];
        notifyListeners();
        // print(_recipeInfo.id);
      } else {
        _error = data['message'];
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
