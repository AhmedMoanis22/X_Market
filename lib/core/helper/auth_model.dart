class AuthModel {
  final String status;
  final String message;
  final Payload payload;

  AuthModel(
      {required this.status, required this.message, required this.payload});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json['status'],
      message: json['message'],
      payload: Payload.fromJson(json['payload']),
    );
  }
}

class Payload {
  final User user;
  final String token;

  Payload({required this.user, required this.token});

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class User {
  final String birthday;
  final String email;
  final String mobile;
  final String fullname;
  final bool isActive;
  final String? profilePic;
  final String? userType;

  User({
    required this.birthday,
    required this.email,
    required this.mobile,
    required this.fullname,
    required this.isActive,
    this.profilePic,
    this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      birthday: json['birthday'],
      email: json['email'],
      mobile: json['mobile'],
      fullname: json['fullname'],
      isActive: json['is_active'],
      profilePic: json['profile_pic'] ?? '',
      userType: json['user_type'] ?? '',
    );
  }
}
