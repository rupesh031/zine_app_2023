import "package:flutter/material.dart";
import 'package:zineapp2023/models/tasks.dart';
import 'package:zineapp2023/models/userTask.dart';
import 'package:zineapp2023/screens/tasks/repo/task_repo.dart';
import 'package:zineapp2023/utilities/DateTime.dart';

class TaskVm extends ChangeNotifier {
  final taskRepo = TaskRepo();

  List<UserTask> _tasks = [];
  List<dynamic> newTask = [];
  int curr = 0;
  int prevLen = 0;
  get tasks => _tasks;

  Future<Tasks> getTemp(UserTask e) async {
    Tasks data = await e.task!.get().then((value) => Tasks.store(value));
    return data;
  }

  void getTasks(userId) async {
    _tasks = await taskRepo.getTasks(userId);
    List<Future<void>> futures = [];

    for (var e in _tasks) {
      futures.add(getTemp(e).then((value) => e.template = value));
    }

    await Future.wait(futures);
    print(_tasks[0].template?.title);
    if (prevLen != _tasks.length) {
      notifyListeners();
      prevLen = _tasks.length;
    }
  }

  UserTask getCurr() {
    return _tasks[curr];
  }

  UserTask? findLatest() {
    UserTask? ans;
    if (tasks.length != 0) ans = tasks[0];
    for (UserTask userTask in tasks) {
      var one = getDMY(userTask.template!.dueDate!),
          two = getDMY(ans!.template!.dueDate!);
      if (one[2] < two[2]) {
        ans = userTask;
      } else if (one[2] == two[2]) {
        if (one[1] < two[1]) {
          ans = userTask;
        } else if (one[1] == two[1]) {
          if (one[0] < two[0]) {
            ans = userTask;
          }
        }
      }
    }
    return ans;
  }
}
