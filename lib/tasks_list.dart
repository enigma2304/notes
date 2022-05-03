import 'package:flutter/material.dart';
import 'todo_container.dart';
import 'tasks.dart';
import 'dart:core';


class Taskslist extends StatefulWidget {
final List<Tasks> tasks;
final bool chosenvalue;
Taskslist({this.tasks, this.chosenvalue});
  @override
  _TaskslistState createState() => _TaskslistState();
}

class _TaskslistState extends State<Taskslist> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoContainer(todotitle: widget.tasks[index].name,
        todotext: widget.tasks[index].text,
        notetype: widget.tasks[index].noteType,
        ischecked: widget.tasks[index].isdone,checkboxtoggle: (checktoggle){
          setState(() {
            widget.tasks[index].togglebox();
          });
        },
        deletecontainer: (){
          setState(() {
            widget.tasks.removeAt(index);
          });
        },
        );
      },
      itemCount: widget.tasks.length,
      physics: BouncingScrollPhysics(),
    );
  }
}
