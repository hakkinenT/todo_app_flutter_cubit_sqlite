// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'] as String?,
      description: json['description'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      completedDate: json['completedDate'] == null
          ? null
          : DateTime.parse(json['completedDate'] as String),
      isCompleted: json['isCompleted'] as int? ?? 0,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'creationDate': instance.creationDate.toIso8601String(),
      'completedDate': instance.completedDate?.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };
