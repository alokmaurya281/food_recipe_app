class Recipes {
  int id;
  String title;
  String img;
  String imgType;

  Recipes({
    required this.id,
    required this.title,
    required this.img,
    required this.imgType,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      id: json['id'],
      title: json['title'],
      img: json['image'],
      imgType: json['imageType'],
    );
  }
}
