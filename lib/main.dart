import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_accounts_crud/shared/navigator_helper.dart';
import 'package:flutter_accounts_crud/ui/pages/splash.dart';
import 'package:provider/provider.dart';
import 'shared/base_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiProvider(
        providers: [],
        child: EasyLocalization(
          // useOnlyLangCode: false,
          path: 'assets/languages',
          supportedLocales: const [Locale('tr', 'TR'), Locale('en', 'US')],
          fallbackLocale: const Locale('tr', 'TR'),
          child: const MyApp(),
        )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorHelper.navigatorKey,
      title: 'Neyasis Technical Case',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: BaseTheme().lightMode,
      darkTheme: BaseTheme().darkMode,
      themeMode: ThemeMode.light,
      home: SplashPage(),
    );
  }
}
