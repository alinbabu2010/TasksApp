import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/utils/extensions.dart';
import 'package:tasks_app/widgets/popup_text_button.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback favoriteOrUnfavoriteCallback;

  const PopupMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.favoriteOrUnfavoriteCallback,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => task.isDeleted == false
          ? [
              const PopupMenuItem(
                value: 1,
                child: PopupTextButton(
                  icon: Icons.edit,
                  label: "Edit",
                ),
              ),
              PopupMenuItem(
                onTap: favoriteOrUnfavoriteCallback,
                child: PopupTextButton(
                  icon:
                      task.isFavorite! ? Icons.favorite_border : Icons.favorite,
                  label: task.isFavorite! ? "Unfavorite task" : "Favorite task",
                ),
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
      onSelected: (value) {
        context.showAddOrEditTaskBottomSheet(task: task);
      },
    );
  }
}
