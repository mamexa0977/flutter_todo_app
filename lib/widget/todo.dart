class ToDo {
  String? id;
  String? todotext;
  bool check;

  ToDo({
    required this.id,
    required this.todotext,
    this.check = false,
  });

  static List<ToDo> todolist() {
    return [
      ToDo(id: '01', todotext: 'check it out', check: true),
      ToDo(
        id: '02',
        todotext: 'THats awesome bro',
      ),
      ToDo(id: '03', todotext: 'we are champion', check: true),
      ToDo(id: '04', todotext: 'ronaldo is hard worker', check: true),
      ToDo(
        id: '05',
        todotext: 'rock lee beats messi',
      ),
      ToDo(id: '06', todotext: 'rock lee beats messi', check: true),
    ];
  }
}
