class User {
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String phone;
  final String role;
  final String description;
  final String imageUrl;
  final String birthdayDate;

  User({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.phone,
    required this.role,
    required this.description,
    required this.imageUrl,
    required this.birthdayDate,
  });
  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        username = json['userName'],
        password = json['password'],
        phone = json['phone'],
        role = json['role'],
        description = json['description'],
        imageUrl = json['imageUrl'],
        birthdayDate = json['birthdayDate'];



  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'password': password,
      'phone': phone,
      'role': role,
      'description': description,
      'imageUrl': imageUrl,
      'birthdayDate': birthdayDate,
    };
  }
}

class LoginResponse {
  final String id;
  final String username;
  final String token;

  LoginResponse({required this.id, required this.username, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'].toString(),
      username: json['username'],
      token: json['token'],
    );
  }
}



class SignupResponse {
  final String message;

  SignupResponse({required this.message});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(message: json['message']);
  }
}