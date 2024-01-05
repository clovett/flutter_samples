import 'package:flutter/material.dart';
import 'package:todo/models.dart';

class TodoTile extends StatelessWidget {
  final TodoTapFunction onTap;
  final Todo todo;

  final TextStyle completedTextStyle = TextStyle(
    decoration: TextDecoration.combine([
      TextDecoration.lineThrough,
    ]),
  );

  TodoTile({
    super.key,
    required this.onTap,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.text,
        style: todo.completed ? completedTextStyle : null,
      ),
      onTap: () => onTap(todo.id),
    );
  }
}
