import 'package:flutter/material.dart';
import 'package:flutter_accounts_crud/shared/config.dart';
import 'package:flutter_accounts_crud/ui/widgets/next_screen.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future afterSplash() async {
    Future.delayed(Duration(seconds: 3), () {
      nextScreenReplace(context, HomePage());
    });
  }

  @override
  void initState() {
    afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData().backgroundColor,
      body: Center(
        child: Image(
          image: AssetImage(Config().splashIcon),
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
