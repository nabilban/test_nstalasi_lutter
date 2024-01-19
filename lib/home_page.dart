import 'package:flutter/material.dart';
import 'to_do_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // dummy data
  List toDoList = [
    ["makan pagi", false],
    ["makan siang", false],
    ["makan sore", false]
  ];

  late TextEditingController taskController; // Add TextEditingController

  @override
  void initState() {
    super.initState();
    taskController = TextEditingController(); // Initialize the controller
  }

  // tapped checkbox function
  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // making new task function
  void createNewTask() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: taskController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukan Task",
                    ),
                  ),
                  const SizedBox(height: 50),
                  MaterialButton(
                    onPressed: () {
                      // Save the task when the button is pressed
                      String newTask = taskController.text;
                      if (newTask.isNotEmpty) {
                        setState(() {
                          toDoList.add([newTask, false]);
                        });
                        Navigator.of(context).pop(); // Close the dialog
                      }
                    },
                    child: const Text('Save Task'),
                  ),
                ],
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 148, 148, 148),
      appBar: AppBar(
        title: const Text('To Do List'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(246, 226, 159, 71),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoItem(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
              deleteTask: () {
                setState(() {
                  toDoList.removeAt(index);
                });
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(Icons.add),
      ),
    );
  }
}
