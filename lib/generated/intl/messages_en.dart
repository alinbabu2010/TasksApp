// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(pending, completed) =>
      "${pending} Pending | ${completed} Completed";

  static String m1(count) =>
      "${Intl.plural(count, one: '1 task', other: '${count} tasks')}";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Tasks App"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Flutter Tasks App"),
        "confirmPasswordError":
            MessageLookupByLibrary.simpleMessage("Password do not match!"),
        "descriptionErrorMsg": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid description"),
        "labelAdd": MessageLookupByLibrary.simpleMessage("Add"),
        "labelAddTask": MessageLookupByLibrary.simpleMessage("Add Task"),
        "labelBack": MessageLookupByLibrary.simpleMessage("Back"),
        "labelCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "labelCompletedTasks":
            MessageLookupByLibrary.simpleMessage("Completed tasks"),
        "labelConfirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "labelCreateAccount":
            MessageLookupByLibrary.simpleMessage("Create account"),
        "labelDarkTheme": MessageLookupByLibrary.simpleMessage("Dark Theme"),
        "labelDelete": MessageLookupByLibrary.simpleMessage("Delete"),
        "labelDeleteAll": MessageLookupByLibrary.simpleMessage("Delete All"),
        "labelDeleteForever":
            MessageLookupByLibrary.simpleMessage("Delete Forever"),
        "labelDescription": MessageLookupByLibrary.simpleMessage("Description"),
        "labelEdit": MessageLookupByLibrary.simpleMessage("Edit"),
        "labelEditTask": MessageLookupByLibrary.simpleMessage("Edit Task"),
        "labelEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "labelError": MessageLookupByLibrary.simpleMessage("Error"),
        "labelFavorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "labelFavoriteTasks":
            MessageLookupByLibrary.simpleMessage("Favorite tasks"),
        "labelForgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "labelLogin": MessageLookupByLibrary.simpleMessage("Login"),
        "labelLogout": MessageLookupByLibrary.simpleMessage("Logout"),
        "labelMyTasks": MessageLookupByLibrary.simpleMessage("My Tasks"),
        "labelPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "labelPendingTasks":
            MessageLookupByLibrary.simpleMessage("Pending tasks"),
        "labelReset": MessageLookupByLibrary.simpleMessage("Reset"),
        "labelRestore": MessageLookupByLibrary.simpleMessage("Restore"),
        "labelSave": MessageLookupByLibrary.simpleMessage("Save"),
        "labelSuccess": MessageLookupByLibrary.simpleMessage("Success"),
        "labelSystemTheme":
            MessageLookupByLibrary.simpleMessage("System Theme"),
        "labelTaskDrawer": MessageLookupByLibrary.simpleMessage("Task Drawer"),
        "labelTitle": MessageLookupByLibrary.simpleMessage("Title"),
        "labelTrash": MessageLookupByLibrary.simpleMessage("Trash"),
        "labelUnfavorite": MessageLookupByLibrary.simpleMessage("Unfavorite"),
        "pendingAndCompletedCount": m0,
        "recoverPasswordDescription": MessageLookupByLibrary.simpleMessage(
            "We will send you an email for password reset link."),
        "recoverPasswordIntro":
            MessageLookupByLibrary.simpleMessage("Reset your password here"),
        "resetPasswordSuccess":
            MessageLookupByLibrary.simpleMessage("An email has been sent"),
        "taskCount": m1,
        "titleErrorMsg":
            MessageLookupByLibrary.simpleMessage("Please enter a valid title")
      };
}
