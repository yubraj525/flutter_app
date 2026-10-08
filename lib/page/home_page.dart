import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tasks = [];
    tasks.add("Task 1");
    tasks.add("Task 2");
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
                title: Text(tasks[index]),
                trailing: Checkbox(value: false, onChanged: (value) {}),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Task"),
                content: TextField(
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
