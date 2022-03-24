import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends Equatable {
  final String? id;
  final String description;
  final DateTime creationDate;
  final DateTime? completedDate;
  final int? isCompleted;

  TodoModel(
      {String? id,
      required this.description,
      this.completedDate,
      this.isCompleted = 0})
      : assert(id == null || id.isNotEmpty, 'id deve ser vazio '),
        id = id ?? const Uuid().v4(),
        creationDate = DateTime.now();

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  TodoModel copyWith(
      {String? id,
      String? description,
      DateTime? completedDate,
      int? isCompleted}) {
    return TodoModel(
        id: id ?? this.id,
        description: description ?? this.description,
        completedDate: completedDate ?? this.completedDate,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  @override
  List<Object?> get props => [id, description, completedDate, isCompleted];
}
