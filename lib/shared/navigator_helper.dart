import 'package:flutter/material.dart';

class NavigatorHelper {
  static final navigatorKey = GlobalKey<NavigatorState>();

  Future pushMaterialPage(BuildContext context, Widget widget) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  Future onBackPressed(BuildContext context) {
    if (Navigator.canPop(context)) return Future.value(true);

    return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("closeApplication"),
              actions: <Widget>[
                TextButton(
                  child: Text("no"),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: Text("yes"),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        ) ??
        Future.value(false);
  }
}
