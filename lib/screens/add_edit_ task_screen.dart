import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_exports.dart';
import 'package:tasks_app/utils/dimens.dart';
import 'package:tasks_app/utils/guid_gen.dart';

import '../generated/l10n.dart';
import '../models/tasks.dart';

class AddOrEditTaskScreen extends StatefulWidget {
  final Task? task;

  const AddOrEditTaskScreen({
    super.key,
    this.task,
  });

  @override
  State<AddOrEditTaskScreen> createState() => _AddOrEditTaskScreenState();
}

class _AddOrEditTaskScreenState extends State<AddOrEditTaskScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _onSubmit(String title, String description, BuildContext context) {
    var tasksBloc = context.read<TasksBloc>();
    if (widget.task != null) {
      tasksBloc.add(UpdateTask(
        task: (widget.task?.copyWith(title: title, description: description))!,
        isEdit: true,
      ));
    } else {
      var task = Task(
        title: title,
        description: description,
        date: DateTime.now().toString(),
        id: GUIDGen.generate(),
      );
      tasksBloc.add(AddTask(task: task));
    }
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    titleController.text = widget.task?.title ?? titleController.text;
    descriptionController.text =
        widget.task?.description ?? descriptionController.text;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(Dimens.addTaskPadding),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              widget.task != null
                  ? appLocale.labelEditTask
                  : appLocale.labelAddTask,
              style: const TextStyle(fontSize: Dimens.addTaskFontSize),
            ),
            const SizedBox(height: Dimens.addTaskSizedBoxHeight),
            TextFormField(
              autofocus: true,
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(appLocale.labelTitle),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return appLocale.titleErrorMsg;
                }
                return null;
              },
            ),
            const SizedBox(height: Dimens.addTaskSizedBoxHeight),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                label: Text(appLocale.labelDescription),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return appLocale.descriptionErrorMsg;
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
                  child: Text(appLocale.labelCancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      _onSubmit(titleController.text,
                          descriptionController.text, context);
                    }
                  },
                  child: Text(
                    widget.task == null
                        ? appLocale.labelAdd
                        : appLocale.labelSave,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
