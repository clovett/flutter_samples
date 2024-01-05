enum VisibilityFilter { showAll, showActive, showCompleted }

class Todo {
  final int id;
  final String text;
  final bool completed;

  const Todo({
    required this.id,
    required this.text,
    this.completed = false,
  });

  Todo copyWith(bool completed) {
    return Todo(
      id: id,
      text: text,
      completed: completed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          completed == other.completed;

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ completed.hashCode;
}

class TodoState {
  final List<Todo> todos;
  final VisibilityFilter visibilityFilter;

  const TodoState({
    required this.todos,
    required this.visibilityFilter,
  });

  TodoState.initialState()
      : todos = <Todo>[],
        visibilityFilter = VisibilityFilter.showAll;
}

typedef TodoTapFunction = void Function(int id);

typedef AddTodoPressedFunction = void Function(String text);

typedef SetVisibilityFilterFunction = void Function(VisibilityFilter filter);
