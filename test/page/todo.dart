import 'package:flutter/material.dart';
import 'package:flutter_app/models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("to-do")),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.all(15.0),
      //       child: Column(
      //         children: [
      //           TextField(
      //             decoration: InputDecoration(
      //               hintText: "Enter a task",
      //               enabledBorder: UnderlineInputBorder(
      //                 borderSide: BorderSide(color: Colors.grey),
      //               ),
      //             ),
      //           ),
      //           SizedBox(height: 10),
      //           ElevatedButton(onPressed: () {}, child: Text("Add Task")),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(tasks[index].title),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //edit icon
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.black),
                      onPressed: () {
                        TextEditingController editController =
                            TextEditingController(text: tasks[index].title);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Edit Task"),
                              content: TextField(
                                controller: editController,
                                decoration: InputDecoration(
                                  hintText: "Edit task",
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tasks[index].title = editController.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Save"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),

                    // Delete icon
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                    ),

                    // Checkbox
                    Checkbox(
                      value: tasks[index].completed,
                      onChanged: (value) {
                        setState(() {
                          tasks[index].completed = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController taskController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Task"),

                content: TextField(
                  controller: taskController,
                  decoration: InputDecoration(hintText: "Enter a task"),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add task logic here
                      SnackBar snackBar = SnackBar(
                        content: Text(
                          "${taskController.text} added to the list",
                        ),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      if (taskController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Task cannot be empty"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      tasks.add(
                        Todo(
                          id: DateTime.now().toString(),
                          title: taskController.text,
                          completed: false,
                        ),
                      );
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                    child: Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
