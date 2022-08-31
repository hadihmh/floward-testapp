import 'package:floward/floward_app.dart';
import 'package:floward/resources/theme.dart';
import 'package:floward/ui/screens/home/home_screen.dart';
import 'package:floward/ui/screens/post/post_screen.dart';
import 'package:flutter/material.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlowardApp extends StatelessWidget {
  const FlowardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floward Test App',
      theme: themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)?.app_name ?? "Floward Text App",
      initialRoute: '/HomePage',
      routes: {
        "/HomePage": (context) => const HomeScreen(),
        "/PostScreen": (context) => const PostScreen()
      },
    );
  }
}
