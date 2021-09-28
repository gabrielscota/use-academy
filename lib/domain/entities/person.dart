import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final String id;
  final String name;
  final int age;
  final double height;

  const PersonEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
  });

  @override
  List<Object> get props => [id, name, age, height];
}
