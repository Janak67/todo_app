import 'package:flutter/cupertino.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/todo_add_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/':(context) => HomeScreen(),
  'add':(context) => ToDoAddScreen(),
};
