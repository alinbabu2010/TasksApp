import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/widgets/popup_text_button.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;

  const PopupMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => task.isDeleted == false
          ? [
              PopupMenuItem(
                child: const PopupTextButton(
                  icon: Icons.edit,
                  label: "Edit",
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                child: const PopupTextButton(
                  icon: Icons.bookmark,
                  label: "Add to Bookmarks",
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                onTap: cancelOrDeleteCallback,
                child: const PopupTextButton(
                  icon: Icons.delete,
                  label: "Delete",
                ),
              ),
            ]
          : [
              PopupMenuItem(
                child: const PopupTextButton(
                  icon: Icons.restore_from_trash,
                  label: "Restore",
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                onTap: cancelOrDeleteCallback,
                child: const PopupTextButton(
                  icon: Icons.delete_forever,
                  label: "Delete Forever",
                ),
              ),
            ],
    );
  }
}
