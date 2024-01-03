import 'package:flutter/material.dart';
import 'package:state/task_view.dart';

class TasksScreen extends StatefulWidget {
  late Function callback;
  // TasksScreen(this.callback);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late String newText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 40.0, bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "TODOEY",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(' tasks',
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.white)),

                  //
                ],
              ),
            ),
            Expanded(
              // flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: TaskView(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.lightBlueAccent,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Column(
                                  children: [
                                    Text("Add Task"),
                                    TextField(
                                        autofocus: true,
                                        onChanged: (value) {
                                          newText = value;
                                        }),
                                    TextButton(
                                        onPressed: () {
                                          // widget.callback();
                                          // print(newText);

                                          // setState(() {
                                          //   taskview.tasks
                                          // .add(Task(task: newText));
                                          // });
                                          // var taskview = TaskView();

                                          // setState(() {
                                          // taskview.getdata(newText);
                                          // });

                                          Navigator.pop(context);
                                        },
                                        child: Text("add task"))
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
