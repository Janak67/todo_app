import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/utils/colors_list.dart';

import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDescripation = TextEditingController();
  bool isGrid = false;
  bool isDarkTheme = false;

  getRandomColor() {
    Random random = Random();
    return backgroundColor[random.nextInt(backgroundColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkTheme ? Colors.blueGrey : Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "To-Do",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
              icon: Icon(
                isGrid ? Icons.list : Icons.grid_view,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isDarkTheme = !isDarkTheme;
                });
              },
              icon: const Icon(Icons.dark_mode_outlined),
            ),
          ],
        ),
        body: isGrid
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 120,
                  crossAxisCount: 2,
                ),
                itemCount: Global.g1.todolist.length,
                itemBuilder: (context, index) {
                  TodoModel todo = Global.g1.todolist[index];
                  return InkWell(
                    onDoubleTap: () {
                      setState(() {
                        Global.g1.todolist.removeAt(index);
                      });
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return updateDialog(index);
                        },
                      );
                      TodoModel s1 = Global.g1.todolist[index];
                      txtTitle.text = s1.title!;
                      txtDescripation.text = s1.descripation!;
                    },
                    child: Container(
                        margin: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                            color: getRandomColor(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title: ${todo.title}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${todo.descripation}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                        )),
                  );
                },
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  TodoModel todo = Global.g1.todolist[index];
                  return InkWell(
                    onDoubleTap: () {
                      setState(() {
                        Global.g1.todolist.removeAt(index);
                      });
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return updateDialog(index);
                        },
                      );
                      TodoModel s1 = Global.g1.todolist[index];
                      txtTitle.text = s1.title!;
                      txtDescripation.text = s1.descripation!;
                    },
                    child: Container(
                        margin: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                            color: getRandomColor(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title: ${todo.title}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${todo.descripation}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                        )),
                  );
                },
                itemCount: Global.g1.todolist.length,
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'add').then((value) {
              setState(() {});
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  AlertDialog updateDialog(int index) {
    return AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: txtTitle,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Title",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: txtDescripation,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Descripation",
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                Global.g1.todolist[index] = TodoModel(
                    title: txtTitle.text, descripation: txtDescripation.text);
              });
              Navigator.pop(context);
            },
            child: const Text("Ok"))
      ],
    );
  }
}
