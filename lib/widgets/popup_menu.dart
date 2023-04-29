import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/utils/extensions.dart';
import 'package:tasks_app/widgets/popup_text_button.dart';

import '../generated/l10n.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback favoriteOrUnfavoriteCallback;
  final VoidCallback restoreCallback;

  const PopupMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.favoriteOrUnfavoriteCallback,
    required this.restoreCallback,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final appLocale = S.of(context);
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
                  label: task.isFavorite!
                      ? appLocale.labelUnfavorite
                      : appLocale.labelFavorite,
                ),
        ),
        PopupMenuItem(
          onTap: cancelOrDeleteCallback,
          child: PopupTextButton(
                  icon: Icons.delete,
                  label: appLocale.labelDelete,
                ),
        ),
      ]
          : [
        PopupMenuItem(
          onTap: restoreCallback,
          child: PopupTextButton(
                  icon: Icons.restore_from_trash,
                  label: appLocale.labelRestore,
                ),
        ),
        PopupMenuItem(
          onTap: cancelOrDeleteCallback,
          child: PopupTextButton(
                  icon: Icons.delete_forever,
                  label: appLocale.labelDeleteForever,
                ),
        ),
      ],
      onSelected: (value) {
        context.showAddOrEditTaskBottomSheet(task: task);
      },
    );
  }
}
