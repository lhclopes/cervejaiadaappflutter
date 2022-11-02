import 'package:cervejaiadaappflutter/pages/splash_screen/splash_screen_delay_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class CervejaiadaApp extends StatelessWidget {
  const CervejaiadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP_TITLE'.tr(),
      home: const SplashScreenDelayPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        dividerColor: Colors.blueAccent,
        backgroundColor: Colors.black,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}