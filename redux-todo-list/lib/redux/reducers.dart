import 'package:todo/models.dart';
import 'package:todo/redux/actions.dart';

List<Todo> todosReducer(List<Todo> state, dynamic action) {
  if (action is AddTodoAction) {
    return <Todo>[...state, Todo(id: action.id, text: action.text)]
      
      ;
  }

  if (action is ToggleTodoAction) {
    return state
        .map((Todo todo) => todo.id == action.id
            ? todo.copyWith(!todo.completed)
            : todo)
        .toList();
  }

  return state;
}

VisibilityFilter visibilityFilterReducer(VisibilityFilter state, action) {
  if (action is SetVisibilityFilterAction) {
    return action.filter;
  }

  return state;
}

TodoState todoAppReducer(TodoState state, dynamic action) {
  return TodoState(
    todos: todosReducer(state.todos, action),
    visibilityFilter: visibilityFilterReducer(state.visibilityFilter, action),
  );
}
