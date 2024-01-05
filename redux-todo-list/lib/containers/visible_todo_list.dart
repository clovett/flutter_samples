import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/components/todo_list.dart';
import 'package:todo/models.dart';
import 'package:todo/redux/actions.dart';

class _ViewModel {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  _ViewModel({
    required this.todos,
    required this.onTodoTap,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              const ListEquality<Todo>().equals(todos, other.todos);

  @override
  int get hashCode => todos.hashCode;
}

class VisibleTodoList extends StatelessWidget {
  const VisibleTodoList({super.key});

  List<Todo> _getVisibleTodos(List<Todo> todos, VisibilityFilter filter) {
    switch (filter) {
      case VisibilityFilter.showAll:
        return todos;
      case VisibilityFilter.showCompleted:
        return todos.where((todo) => todo.completed).toList();
      case VisibilityFilter.showActive:
        return todos.where((todo) => !todo.completed).toList();
      default:
        return <Todo>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel(
            todos: _getVisibleTodos(
                store.state.todos, store.state.visibilityFilter),
            onTodoTap: (id) => store.dispatch(
                  ToggleTodoAction(id: id),
                ),
          ),
      builder: (context, viewModel) => TodoList(
            todos: viewModel.todos,
            onTodoTap: viewModel.onTodoTap,
          ),
    );
  }
}
