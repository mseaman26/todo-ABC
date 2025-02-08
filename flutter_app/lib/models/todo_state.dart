import 'package:flutter/material.dart';
import 'package:flutter_app/models/todo_model.dart';

class TodoState extends ChangeNotifier {
  Map<String, List<Todo>> todosByTab = {
    "tab1": [],
    "tab2": [],
    "tab3": [],
  };

  void addTodo(String tab, Todo todo) {
    todosByTab[tab]?.add(todo);
    notifyListeners();
  }

  void moveTodo(String fromTab, String toTab, Todo todo) {
    todosByTab[fromTab]?.remove(todo);
    todosByTab[toTab]?.add(todo);
    notifyListeners();
  }

  void removeTodo(String tab, Todo todo) {
    todosByTab[tab]?.remove(todo);
    notifyListeners();
  }
}
