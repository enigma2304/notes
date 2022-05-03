class Tasks {
 String name;
 String text;
 bool isdone;
 bool noteType;

Tasks({this.name, this.isdone = false, this.text, this.noteType});

void togglebox () {
  isdone =!isdone;
}
}