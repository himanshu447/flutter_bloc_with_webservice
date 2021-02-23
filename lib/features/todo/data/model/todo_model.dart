import 'package:flutter_bloc_practice/features/todo/core/constant.dart';

class ToDoModel {
  final int id;
  final String title;
  final String description;
  final int createdOn;

  ToDoModel({
    this.id,
    this.title,
    this.description,
    this.createdOn,
  });

  Map<String, dynamic> toMap() {
    return {
      '${ConstantUtils.columnTitle}': title,
      '${ConstantUtils.columnDesc}': description,
      '${ConstantUtils.columnDate}': DateTime.now().millisecondsSinceEpoch,
    };
  }

  factory ToDoModel.fromMap({Map<String, dynamic> map}) {
    return ToDoModel(
      id: map[ConstantUtils.columnId] != null
          ? map[ConstantUtils.columnId]
          : null,
      description: map[ConstantUtils.columnDesc],
      title: map[ConstantUtils.columnTitle],
      createdOn: map[ConstantUtils.columnDate] != null ? map[ConstantUtils.columnDate] : null,
    );
  }

  ToDoModel copyWith({
    int tempId,
    String tempTitle,
    String tempDescription,
    int tempCreatedOn,
  }) {
    return ToDoModel(
      id: tempId ?? id,
      description: tempDescription ?? description,
      title: tempTitle ?? title,
      createdOn: tempCreatedOn ?? createdOn,
    );
  }
}
