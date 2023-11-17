import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? responsecode;
  String? message;
  String? token;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  @JsonKey(name: 'expires_in')
  int? expiresIn;
  @JsonKey(name: 'refresh_token_expires_in')
  int? refreshTokenExpiresIn;
  @JsonKey(name: 'token_type')
  String? tokenType;
  Data? data;

  User({
    this.responsecode,
    this.message,
    this.token,
    this.refreshToken,
    this.expiresIn,
    this.refreshTokenExpiresIn,
    this.tokenType,
    this.data,
  });

  @override
  String toString() {
    return 'User(responsecode: $responsecode, message: $message, token: $token, refreshToken: $refreshToken, expiresIn: $expiresIn, refreshTokenExpiresIn: $refreshTokenExpiresIn, tokenType: $tokenType, data: $data)';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
