class UserDetail {
  final int id;
  final String username;
  final String email;
  final String imageUrl;

  const UserDetail({
    required this.id,
    required this.username,
    required this.email,
    required this.imageUrl

  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      imageUrl: json['avatar'] as String

    );
  }
}