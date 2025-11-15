// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Bank {
  final int id;
  final String name;
  final String logo;
  final String shortName;
  Bank({required this.id, required this.name, required this.logo, required this.shortName});

  Bank copyWith({int? id, String? name, String? logo, String? shortName}) {
    return Bank(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      shortName: shortName ?? this.shortName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'logo': logo, 'shortName': shortName};
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      id: map['id'] as int,
      name: map['name'] as String,
      logo: map['logo'] as String,
      shortName: map['shortName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      shortName: json['shortName'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Bank(id: $id, name: $name, logo: $logo, shortName: $shortName)';
  }

  @override
  bool operator ==(covariant Bank other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.logo == logo && other.shortName == shortName;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ logo.hashCode ^ shortName.hashCode;
  }
}
