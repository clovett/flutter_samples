import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo/components/app.dart';
import 'package:todo/models.dart';
import 'package:todo/redux/reducers.dart';


void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  TodoApp({super.key});
  
  final Store<TodoState> store = Store<TodoState>(todoAppReducer, initialState: TodoState.initialState());

  // This widget is the root of your application.
 @override
  Widget build(BuildContext context) {
    return StoreProvider<TodoState>(
      store: store,
      child: MaterialApp(
        title: 'todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const App(),
      ),
    );
  }
}