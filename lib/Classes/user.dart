class User {
  final String user;
  final String password;

  User({this.user, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(user: json['user'], password: json['password']);
  }
}
