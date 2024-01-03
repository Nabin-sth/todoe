import 'package:flutter/material.dart';
import 'package:state/screens/task_screen.dart';
import 'package:state/task_list.dart';

class Task {
  late final String task;
  final bool isDone;

  Task({required this.task, this.isDone = false});
}

class TaskView extends StatefulWidget {
  List<Task> tasks = [];

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TextField for entering task
        TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Enter Task'),
        ),
        // Button to add task
        ElevatedButton(
          onPressed: () {
            // Call a function to add task to the list
            addTask();
          },
          child: Text('Add Task'),
        ),
        // Display the task list
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Tasklist(
                task: widget.tasks[index].task,
                isChecked: widget.tasks[index].isDone,
              );
            },
            itemCount: widget.tasks.length,
          ),
        ),
      ],
    );
  }

  // Function to add task to the list
  void addTask() {
    // Get the task name from the TextField
    String taskName = _controller.text;

    // Check if the task name is not empty
    if (taskName.isNotEmpty) {
      // Use setState to update the state and trigger a rebuild
      setState(() {
        // Create a new Task instance and add it to the list
        widget.tasks.add(Task(task: taskName));
      });

      // Clear the TextField after adding the task
      _controller.clear();
    }
  }
}

// late String name;
// class Task {
//   late final String task;
//   final bool isDone = false;


//   Task({required this.task});
// }

// class TaskView extends StatefulWidget {
//   String? taskname;
//   List<Task> tasks = [];
//   String getdata(String task) {
//     taskname = task;
//     if ((taskname) != null) {
//       // setState(() {
//       tasks.add(Task(task: (taskname)!));
//       print(tasks.length);
//       print(tasks[0]);
//       // Widget.build;

//       // });
//     }
//         return taskname!;

//   }

//   @override
//   State<TaskView> createState() => _TaskViewState();
// }

// class _TaskViewState extends State<TaskView> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     print(widget.tasks.length);
//     if ((widget.taskname) != null) {
//       print(widget.taskname);
//       setState(() {
//         widget.tasks.add(Task(task: (widget.taskname)!));
//       });
//     }
//     // return Container(child: Text(
//       // Ta
//     // ));

//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return Tasklist(
//           task: widget.tasks[index].task,
//           isChecked: widget.tasks[index].isDone,
//         );
//       },
//       itemCount: widget.tasks.length,
//     );
//   }
// }
