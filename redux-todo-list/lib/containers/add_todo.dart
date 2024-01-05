import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/models.dart';
import 'package:todo/redux/actions.dart';

class _ViewModel {
  final AddTodoPressedFunction onAddPressed;

  _ViewModel({
    required this.onAddPressed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  AddTodoState createState() => AddTodoState();
}

class AddTodoState extends State<AddTodo> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel(
            onAddPressed: (todoText) => store.dispatch(
                  AddTodoAction(text: todoText),
                ),
          ),
      builder: (context, viewModel) => TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Add todo'),
            onSubmitted: (todoText) {
              viewModel.onAddPressed(todoText);
              _controller.text = '';
            },
          ),
    );
  }
}
