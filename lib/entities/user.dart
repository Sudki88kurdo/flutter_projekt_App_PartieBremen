class User {
  final String firstName;
  final String lastName;
  final DateTime? dob;
  final String email;
  final String password;
  final bool verified;

  User({
    required this.firstName,
    required this.lastName,
    this.dob,
    required this.email,
    required this.password,
    required this.verified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      verified: json['verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob?.toIso8601String(),
      'email': email,
      'password': password,
      'verified': verified,
    };
  }
}
