class Recipe {
  final String id;
  final String name;
  final String image;
  final String instructions;
  final double rating;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.instructions,
    required this.rating,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    // Extract instructions dynamically as there can be up to 20 ingredients/measures
    String instructions = '';
    for (int i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null &&
          json['strIngredient$i'].isNotEmpty) {
        instructions += '${json['strIngredient$i']}';
        if (json['strMeasure$i'] != null && json['strMeasure$i'].isNotEmpty) {
          instructions += ' (${json['strMeasure$i']})';
        }
        instructions += '\n';
      }
    }
    instructions +=
        '\nInstructions: ${json['strInstructions'] ?? 'No instructions available.'}';

    return Recipe(
      id: json['idMeal'],
      name: json['strMeal'],
      image: json['strMealThumb'],
      instructions: instructions,
      rating:
          (3.0 + (5.0 - 3.0) * (json['idMeal'].hashCode % 1000) / 999)
              .toDouble(), // Mock rating
    );
  }
}
