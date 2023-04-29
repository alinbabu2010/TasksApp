import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/widgets/task_tile.dart';

import '../generated/l10n.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    final appLocale = S.of(context);
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          dividerColor: Theme.of(context).colorScheme.background,
          elevation: 1,
          children: taskList
              .map((task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isOpen) => TaskTile(task: task),
                    body: ListTile(
                      title: SelectableText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${appLocale.labelTitle}\n",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: task.title),
                            TextSpan(
                              text: "\n\n${appLocale.labelDescription}\n",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: task.description),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
