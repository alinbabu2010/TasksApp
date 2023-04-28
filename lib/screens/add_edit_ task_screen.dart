import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_exports.dart';
import 'package:tasks_app/utils/dimens.dart';
import 'package:tasks_app/utils/guid_gen.dart';

import '../models/tasks.dart';

class AddOrEditTaskScreen extends StatelessWidget {
  final Task? task;

  AddOrEditTaskScreen({
    super.key,
    this.task,
  });

  final formKey = GlobalKey<FormState>();

  void _onSubmit(String title, String description, BuildContext context) {
    if (task != null) {
      context.read<TasksBloc>().add(UpdateTask(
            task: (task?.copyWith(title: title, description: description))!,
            isEdit: true,
          ));
    } else {
      var task = Task(
        title: title,
        description: description,
        date: DateTime.now().toString(),
        id: GUIDGen.generate(),
      );
      context.read<TasksBloc>().add(AddTask(task: task));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: task?.title);
    titleController.selection =
        TextSelection.collapsed(offset: titleController.text.length);
    TextEditingController descriptionController =
        TextEditingController(text: task?.description);
    return Padding(
      padding: const EdgeInsets.all(Dimens.addTaskPadding),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              task != null ? "Edit Task" : "Add Task",
              style: const TextStyle(fontSize: Dimens.addTaskFontSize),
            ),
            const SizedBox(height: Dimens.addTaskSizedBoxHeight),
            TextFormField(
              autofocus: true,
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a valid title";
                }
                return null;
              },
            ),
            const SizedBox(height: Dimens.addTaskSizedBoxHeight),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a valid description";
                }
                return null;
              },
            ),
            const SizedBox(height: Dimens.addTaskSizedBoxHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        _onSubmit(titleController.text,
                            descriptionController.text, context);
                      }
                    },
                    child: Text(task == null ? 'Add' : 'Save')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
