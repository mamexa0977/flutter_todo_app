import 'package:flutter/material.dart';
import 'package:todo/widget/todo.dart';

class MyTile extends StatelessWidget {
  const MyTile(
      {Key? key,
      required this.todo,
      required this.changed,
      required this.delete})
      : super(key: key);

  final ToDo todo;
  final changed;
  final delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        tileColor: Colors.white,
        minLeadingWidth: 20,
        minVerticalPadding: 1,
        onTap: () {
          changed(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        leading: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: todo.check
                ? Icon(
                    Icons.check_box,
                    color: Colors.blue,
                  )
                : Icon(Icons.check_box_outline_blank, color: Colors.blue)),
        title: Text(
          todo.todotext!,
          style: TextStyle(
              decoration: todo.check ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: IconButton(
              padding: EdgeInsets.all(5),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                delete(todo.id);
              },
            )),
      ),
    );
  }
}
