class Recipe {
  int id;
  String title;
  String img;
  String imgType;

  Recipe({
    required this.id,
    required this.title,
    required this.img,
    required this.imgType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      img: json['image'],
      imgType: json['imageType'],
    );
  }
}
