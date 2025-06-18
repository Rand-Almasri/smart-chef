import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/recipe_model.dart';
import '../model/category_model.dart';

class RecipeController {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories.php'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> categoriesJson = data['categories'];
      return categoriesJson.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Recipe>> fetchMealsByCategory(String categoryName) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/filter.php?c=$categoryName'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsJson = data['meals'] ?? [];
      // For filter by category, the API returns limited info, so we need to fetch full details for each meal
      List<Recipe> meals = [];
      for (var mealJson in mealsJson) {
        final mealDetail = await fetchRecipeDetails(mealJson['idMeal']);
        if (mealDetail != null) {
          meals.add(mealDetail);
        }
      }
      return meals;
    } else {
      throw Exception('Failed to load meals for category $categoryName');
    }
  }

  Future<List<Recipe>> searchRecipes(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/search.php?s=$query'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsJson = data['meals'] ?? [];
      return mealsJson.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search recipes for $query');
    }
  }

  Future<Recipe?> fetchRecipeDetails(String mealId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/lookup.php?i=$mealId'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsJson = data['meals'] ?? [];
      if (mealsJson.isNotEmpty) {
        return Recipe.fromJson(mealsJson.first);
      }
      return null;
    } else {
      throw Exception('Failed to load recipe details for $mealId');
    }
  }

  Future<List<Recipe>> fetchRandomRecipes(int count) async {
    List<Recipe> randomRecipes = [];
    for (int i = 0; i < count; i++) {
      final response = await http.get(Uri.parse('$_baseUrl/random.php'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> mealsJson = data['meals'] ?? [];
        if (mealsJson.isNotEmpty) {
          randomRecipes.add(Recipe.fromJson(mealsJson.first));
        }
      } else {
        print('Failed to load random recipe: ${response.statusCode}');
      }
    }
    return randomRecipes;
  }
}
