import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  final bool ischecked;
  final String todotext;
  final String todotitle;
  final Function checkboxtoggle;
  final Function deletecontainer;
  final bool notetype;

  TodoContainer(
      {this.ischecked,
      this.todotext,
      this.todotitle,
      this.checkboxtoggle,
      this.deletecontainer,
      this.notetype});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0x70FFFFFF),
                Colors.white,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x39000000),
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 8.0,
                spreadRadius: 2.0,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(35.0)),
        child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: GestureDetector(
              onDoubleTap: deletecontainer,
              child: ExpansionTile(
                children: [
                  ListTile(
                    title: Text(todotext,
                        style: ischecked
                            ? TextStyle( decoration: TextDecoration.lineThrough,)
                            : null),
                    trailing: notetype ? Checkbox(
                      activeColor: Colors.black,
                      onChanged: checkboxtoggle,
                      value: ischecked,
                    ) : null,
                  )
                ],
                title: Text(
                  todotitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )),
      ),
    );
  }
}
