import 'dart:convert';

import '../values/user_permission.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String? nickname;
  Set<UserPermission> permissions;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.nickname,
    this.permissions = const {},
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      nickname: map['nickname'],
      permissions: Set<UserPermission>.from(
        map['permissions']?.map((permission) {
              return UserPermissions.parse(permission);
            }) ??
            {},
      ),
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'nickname': nickname,
      'permissions': permissions.map((permission) {
        return permission.toMap();
      }).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
