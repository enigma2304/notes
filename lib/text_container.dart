import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String todotext;
  final String todotitle;
  final Function deletecontainer;

  TextContainer({this.todotext, this.todotitle, this.deletecontainer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 8.0,
                spreadRadius: 2.0,
              ),
            ],
            border: Border.all(width: 2, color: Colors.white),
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0)),
        child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: GestureDetector(
              onDoubleTap: deletecontainer,
              child: ExpansionTile(
                title: Text(
                  todotitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
                children: [
                  ListTile(
                    title: Text(
                      todotext,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
