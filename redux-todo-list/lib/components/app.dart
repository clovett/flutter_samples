import 'package:flutter/material.dart';
import 'package:todo/components/footer.dart';
import 'package:todo/containers/add_todo.dart';
import 'package:todo/containers/visible_todo_list.dart';

class App extends StatelessWidget {
  
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Todos'),
      ),
      body: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: const Column(
          children: <Widget>[
            AddTodo(),
            VisibleTodoList(),
            Footer(),
          ],
        ),      
      ),
    );
  }
}
