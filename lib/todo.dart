import 'package:flutter/material.dart';
import 'package:you_do/model/model.dart';
import '../constants/colors.dart';
class ToDoItem extends StatelessWidget {
  final ToDo todo;
final ontodochange;
final delete;
  const ToDoItem({Key? key,required this.todo,required this.ontodochange,required this.delete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5,top: 10),
      child: ListTile(
      onTap: (){
ontodochange(todo);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      tileColor: Colors.white,
      leading: Icon(todo.isDone?Icons.check_box:Icons.check_box_outline_blank,color: tdBlue,),
      title: Text(todo.todoText!,
      style: TextStyle(
        fontSize: 16,
        color: tdBlack,
        decoration:todo.isDone? TextDecoration.lineThrough:null,
      ),),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 35,
          width: 35,
          decoration: BoxDecoration(color: tdRed,
          borderRadius: BorderRadius.circular(5),),
        child: IconButton(
          color:Colors.white,
          iconSize: 18,
          icon: Icon(Icons.delete),
          onPressed: (){
delete(todo.id);
          },
        ),
      ),
    ),);
  }
}
