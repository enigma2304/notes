import 'package:flutter/material.dart';

class BottomContainer extends StatefulWidget {
  final Function addcallbacktext;
  BottomContainer({this.addcallbacktext});

  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  static String tasktitle;
  static String tasktext;
  static String chosenValue;
  final List<DropdownMenuItem> notetype = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff747474),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                child: Center(
                  child: DropdownButton<String>(
                    value: chosenValue,
                    elevation: 5,
                    style: TextStyle(color: Colors.white),
                    dropdownColor: Colors.black,
                    items: <String>[
                      'Note',
                      'To-Do',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Please choose a type",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        chosenValue = value;
                      });
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 8.0),
                    child: Text(
                      'Title:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'enter the title here',
                          labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 15.0,),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        onChanged: (newtasktitle) {
                          tasktitle = newtasktitle;
                        },
                      
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 8.0),
                    child: Text(
                      'Note:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'enter your note/to-do here',
                          labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 15.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        onChanged: (newtext) {
                          tasktext = newtext;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: TextButton(
                  child: Text(
                    'Enter',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    widget.addcallbacktext(tasktext, tasktitle, chosenValue);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
