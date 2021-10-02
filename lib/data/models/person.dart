import '../../domain/entities/entities.dart';

class RemotePersonModel {
  final String id;
  final String name;
  final int age;
  final int height;
  final int weight;

  RemotePersonModel({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  factory RemotePersonModel.fromJson(Map<String, dynamic> json) => RemotePersonModel(
        id: (json['id'] ?? '').toString(),
        name: (json['name'] ?? '').toString(),
        age: (json['age'] ?? 0) as int,
        height: (json['height'] ?? 0) as int,
        weight: (json['weight'] ?? 0) as int,
      );

  factory RemotePersonModel.fromEntity(PersonEntity entity) => RemotePersonModel(
        id: entity.id,
        name: entity.name,
        age: entity.age,
        height: entity.height.toInt(),
        weight: 0,
      );

  PersonEntity toEntity() => PersonEntity(
        id: id,
        name: name,
        age: age,
        height: height.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}
