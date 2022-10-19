import 'package:flutter/material.dart';

class UiHelper {
  static Future<bool?> showDailogBox(
    BuildContext context,
    Widget content,
  ) {

    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        final mediaQuery = MediaQuery.of(context);

        return AnimatedContainer(
          padding: mediaQuery.padding,
          duration: const Duration(milliseconds: 300),
          child: AlertDialog(
            // title: Text(title, style: Styles.headingStyle3()),
            content: content,
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: const Text(
                  "Cancel",
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.blue,
                child: const Text(
                  "Save",
                ),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        );
      },
    );
  }
}
