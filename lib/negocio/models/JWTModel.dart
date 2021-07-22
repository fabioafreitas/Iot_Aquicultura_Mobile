class JWTModel {
  final String jwt;

  JWTModel({required this.jwt});

  factory JWTModel.fromJson(final json) {
    return JWTModel(jwt: json['jwt']);
  }
}
