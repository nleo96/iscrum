import 'dart:convert';

class UserPermission {
  final int id;
  final String alias;

  const UserPermission._({
    required this.id,
    required this.alias,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alias': alias,
    };
  }

  String toJson() => json.encode(toMap());
}

abstract class UserPermissions {
  static const UserPermission scrumMaster = UserPermission._(
    id: 1,
    alias: 'Scrum Master',
  );

  static const UserPermission productOwner = UserPermission._(
    id: 2,
    alias: 'Product Owner',
  );

  static const UserPermission developer = UserPermission._(
    id: 3,
    alias: 'Desenvolvedor',
  );

  static const List<UserPermission> values = [
    scrumMaster,
    productOwner,
    developer,
  ];

  static UserPermission parse(int id) {
    return values.firstWhere((type) => type.id == id);
  }

  static UserPermission? tryParse(int id) {
    try {
      return parse(id);
    } catch (_) {
      return null;
    }
  }
}
