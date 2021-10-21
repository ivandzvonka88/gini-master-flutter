import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalUnSavedAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Unsaved Changes"),
      content:
      Text("Do you want to save the changes to your profile?"),
      actions: [
        CupertinoDialogAction(
          child: Text("Save"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: Text("Discard"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
