import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  int? id;
  String? name;
  String? description;

  Role({this.id, this.name, this.description});

  @override
  String toString() {
    return 'Role(id: $id, name: $name, description: $description)';
  }

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
