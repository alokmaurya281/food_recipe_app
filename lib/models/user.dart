class User {
  String id;
  String username;
  String name;
  String email;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
    );
  }
}
