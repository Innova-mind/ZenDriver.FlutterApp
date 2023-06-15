class Profiles {
  int id;
  User user;
  String startingYear;

  Profiles({required this.id, required this.user, required this.startingYear});

  Profiles.fromJson(Map<String, dynamic> json):
      id = json['id'],
      user = User.fromJson(json['user']),
      startingYear= json['startingYear'];
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String password;
  final String phone;
  final String role;
  final String description;
  final String imageUrl;
  final String birthdayDate;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.phone,
    required this.role,
    required this.description,
    required this.imageUrl,
    required this.birthdayDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      password: json['password'],
      phone: json['phone'],
      role: json['role'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      birthdayDate: json['birthdayDate'],
    );
  }
}
