import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

import '../utils/global.dart';

class ToDoAddScreen extends StatefulWidget {
  const ToDoAddScreen({Key? key}) : super(key: key);

  @override
  State<ToDoAddScreen> createState() => _ToDoAddScreenState();
}

class _ToDoAddScreenState extends State<ToDoAddScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDescripation = TextEditingController();
  String dropdownValue = 'Low';
  var low = ['Low', 'Medium', 'High', 'Urgent'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "To - Do",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dark_mode),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    "Add To-Do",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        TodoModel details = TodoModel(
                            title: txtTitle.text,
                            descripation: txtDescripation.text);
                        Global.g1.todolist.add(details);
                        Navigator.pop(
                            context, [txtTitle.text, txtDescripation.text]);
                      },
                      icon: const Icon(
                        Icons.save,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.grid_view)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                  hintText: "ToDo-5",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtDescripation,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Descripation",
                  hintText: "Dummy Content",
                ),
              ),
            ),
            DropdownButton(
              items: low.map((String low) {
                return DropdownMenuItem(
                  value: low,
                  child: Text(low),
                );
              }).toList(),
              value: dropdownValue,
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
