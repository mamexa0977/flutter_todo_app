import 'package:flutter/material.dart';
import 'package:todo/widget/ListTile.dart';
import 'package:todo/widget/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textcontroller = TextEditingController();
  final todoList = ToDo.todolist();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xFFEEEFF5,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(
          0xFFEEEFF5,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.black),
            Container(
                child: CircleAvatar(
              child: Image.network(''),
            ))
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        50,
                      )),
                  child: TextField(
                    
                    decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView(children: [
                    Container(
                      child: Text('All Todos'),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    for (ToDo todo in todoList)
                      MyTile(
                        todo: todo,
                        changed: changes,
                        delete: deletes,
                      ),
                  ]),
                ),
              ])),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                margin: EdgeInsets.symmetric(horizontal: 27, vertical: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white24,
                          offset: Offset(0, 0),
                          blurRadius: 10)
                    ]),
                child: TextField(controller: textcontroller,
                    decoration: InputDecoration(
                        hintText: 'Add Your Todo Here',
                        border: InputBorder.none)),
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    additem(textcontroller.text);
                  },
                  child: Text('+'),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  void changes(ToDo todo) {
    setState(() {
      todo.check = !todo.check;
    });
  }

  void deletes(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void additem(String toDo) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todotext: toDo));
    });
    textcontroller.clear();
  }
}
