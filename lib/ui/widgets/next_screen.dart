import 'package:flutter/material.dart';

import '../../shared/navigator_helper.dart';

Future nextScreen(c, page) {
  var context = c ?? NavigatorHelper.navigatorKey.currentContext;
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Future nextScreenReplace(c, page) async {
  var context = c ?? NavigatorHelper.navigatorKey.currentContext;
  await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenPopup(c, page) {
  var context = c ?? NavigatorHelper.navigatorKey.currentContext;
  Navigator.push(
    context,
    MaterialPageRoute(fullscreenDialog: true, builder: (context) => page),
  );
}
