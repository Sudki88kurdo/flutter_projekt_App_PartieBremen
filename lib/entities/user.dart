import 'package:freezed_annotation/freezed_annotation.dart';


part 'user.freezed.dart';
part 'user.g.dart';
enum Role { DEFAULT, USER, CREATOR, MODERATOR, ADMIN, DECIDER }
@freezed
class User with _$User {

  const factory User({
    @Default("") String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? surname,
    required DateTime dob,
    String? email,
    String? password,
    bool? verified,
    @Default(Role.DEFAULT) Role? role,
    bool? active,
  }) = _User;


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

