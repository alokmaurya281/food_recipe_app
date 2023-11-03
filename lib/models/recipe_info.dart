class Recipe {
  String id;
  bool vegeterian;
  String title;
  String readyInMinutes;
  String servings;
  String sourceUrl;
  String image;
  String imageType;
  String summary;
  String dishTypes;
  String instructions;
  String spoonacularSourceUrl;
  String pricePerServing;
  Map<String, dynamic> extendedIngredients;

  Recipe({
    required this.id,
    required this.vegeterian,
    required this.dishTypes,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.image,
    required this.imageType,
    required this.summary,
    required this.instructions,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.spoonacularSourceUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      vegeterian: json['vegeterian'],
      dishTypes: json['dishTypes'],
      title: json['title'],
      readyInMinutes: json['readyInMinutes'],
      servings: json['servings'],
      sourceUrl: json['sourceUrl'],
      image: json['image'],
      imageType: json['imageType'],
      summary: json['summary'],
      instructions: json['instructions'],
      pricePerServing: json['pricePerServing'],
      extendedIngredients: json['extendedIngredients'],
      spoonacularSourceUrl: json['spoonacularSourceUrl'],
    );
  }
}
