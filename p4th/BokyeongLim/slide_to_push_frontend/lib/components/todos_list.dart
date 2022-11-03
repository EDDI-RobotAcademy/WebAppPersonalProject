import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/components/todo_component.dart';
class TodosList extends StatefulWidget {
  const TodosList({Key? key}) : super(key: key);

  @override
  State<TodosList> createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int num ){
          return TodoComponent();
        },
    )
    );
  }
}
