import 'package:flutter/material.dart';
import 'package:you_do/constants/colors.dart';
import 'package:you_do/todo.dart';

import 'model/model.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final todoList=ToDo.todolist();
List<ToDo> found=[];
final tocont=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
  found=todoList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15,),
child: Column(
  children: [
searchBox(),
    Expanded(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50,bottom: 20),
                child: Text('All Tasks',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),),
              ),
               for(ToDo todo in found.reversed)
               ToDoItem(todo:todo,
               ontodochange: handletodochange,
               delete: deletetodo,),
            ],
          ),
    )
  ],
),
          ),

          Align(
            alignment:Alignment.bottomCenter ,
            child: Row(children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
               padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
               decoration: BoxDecoration(
                 color: Colors.white,
                boxShadow: const [BoxShadow(
                  color: Colors.grey,
                  offset:Offset(0, 0),
                ),],
                 borderRadius: BorderRadius.circular(10),

               ),
                child: TextField(
                  controller: tocont,
                  decoration: InputDecoration(
                    hintText: 'Add a New Task',
                    border: InputBorder.none
                  ),
                ),
              ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20,right:20 ),
                child: ElevatedButton(
                  child: Text('+',style:TextStyle(fontSize: 40,) ,),
                  onPressed: (){
                    add(tocont.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  void handletodochange(ToDo tod){
 setState(() {
   tod.isDone=!tod.isDone;
 });
  }

void deletetodo(String id){
    setState(() {
      todoList.removeWhere((item)=>item.id==id);
    });

}

void add(String todo){
  if(todo.isNotEmpty){
setState(() {
  todoList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: todo));
});}

tocont.clear();
}

void runfilter(String entered){
  List<ToDo> res=[];
  if(entered.isEmpty){
    res=todoList;
  }
  else{
    res=todoList.where((item)=>item.todoText!.toLowerCase().contains(entered.toLowerCase())).toList();

  }
  setState(() {
    found=res;
  });

}
  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value)=>runfilter(value),
        decoration: InputDecoration(
            contentPadding:EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search,color:tdBlack,
              size: 20,),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 25,
            ),
            border: InputBorder.none
        ),
      ),
    );

  }

  AppBar buildAppBar() {
    return AppBar(backgroundColor: tdBGColor,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Icon(Icons.menu,color: tdBlack,size: 30,
      ),

      Container(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius:BorderRadius.circular(20),
        child: Image.asset('assets/ava.jpg'),),
      ),

    ],),);
  }
}
