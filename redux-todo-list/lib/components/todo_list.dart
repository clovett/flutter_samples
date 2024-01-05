import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/models.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  const TodoList({
    super.key,
    required this.todos,
    required this.onTodoTap,
  });

  List<Widget> _buildListItems() {
    return todos
        .map((todo) => TodoTile(
              key: Key(todo.id.toString()),
              todo: todo,
              onTap: onTodoTap,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildListItems(),
    );
  }
}
