import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission {
  int? id;
  String? name;
  String? description;

  Permission({this.id, this.name, this.description});

  @override
  String toString() {
    return 'Permission(id: $id, name: $name, description: $description)';
  }

  factory Permission.fromJson(Map<String, dynamic> json) {
    return _$PermissionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}
