import "package:flutter/material.dart";

class Tasklist extends StatefulWidget {
  final String task;
  bool isChecked;

  Tasklist({required this.task, required this.isChecked});

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  // bool isChecked = false;
  TextDecoration decor = TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task,
          style: TextStyle(
            decoration: decor,
          )),
      trailing: Checkbox(
          value: widget.isChecked,
          onChanged: (value) {
            print("object");
            setState(() {
              widget.isChecked = value!;
              widget.isChecked
                  ? (decor = TextDecoration.lineThrough)
                  : (decor = TextDecoration.none);
            });
          }),
    );
  }
}
