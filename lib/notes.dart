import 'dart:ui';
import 'package:flutter/material.dart';
import 'bottom_container.dart';
import 'tasks_list.dart';
import 'tasks.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final List<Tasks> tasks = [
    Tasks(name: 'this is a dummy', text: 'double tap to delete, to update note numbers, click on the name of the app', noteType: false),
  ];
  bool notesType = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomContainer(
                        addcallbacktext: (tasktext, tasktitle, chosenvalue) {
                          setState(() {
                            if (chosenvalue == 'To-Do') {
                              notesType = true;
                            } else {
                              notesType = false;
                            }
                          });
                          tasks.add(Tasks(
                              name: tasktitle,
                              text: tasktext,
                              noteType: notesType));
                        },
                      ));
            },
            elevation: 30.0,
            backgroundColor: Colors.black,
            child: Icon(Icons.add)),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tasks.length;
                    });
                  },
                                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 4.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0))),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Notez',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 50.0,
                                  letterSpacing: 8.0)),
                          SizedBox(height: 10.0),
                          Text('${tasks.length} notes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18.0))
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                flex: 2,
                child: Taskslist(
                  tasks: tasks,
                  chosenvalue: notesType,
                ),
              ),
            ],
          ),
        ));
  }
}
