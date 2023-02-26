import 'package:flutter/cupertino.dart';

class ToDo{
  String?id;
  String?todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,

});
  static List<ToDo> todolist(){
    return[
ToDo(id: '01', todoText: 'Exer',isDone:true),
      ToDo(id: '02', todoText: 'Buy',isDone: true),
      ToDo(id: '03', todoText: 'Buy'),
      ToDo(id: '04', todoText: 'Buy'),
    ];
  }

}