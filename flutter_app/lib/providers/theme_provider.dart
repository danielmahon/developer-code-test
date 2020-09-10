import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = StateProvider(
  (_) => ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      // primarySwatch: Colors.blue,
      primaryColor: const Color.fromARGB(255, 31, 36, 47),
      accentColor: const Color.fromARGB(255, 32, 108, 94),
      primaryColorDark: const Color.fromARGB(255, 17, 19, 27),
      // This makes the visual density adapt to the platform that you run
      // the app on. For desktop platforms, the controls will be smaller and
      // closer together (more dense) than on mobile platforms.
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      // Typography
      typography: Typography.material2018(),
      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).copyWith(
        headline1: GoogleFonts.alegreya(),
        headline2: GoogleFonts.alegreya(),
        headline3: GoogleFonts.alegreya(),
        headline4: GoogleFonts.alegreya(color: Colors.red),
        headline5: GoogleFonts.alegreya(),
        headline6: GoogleFonts.alegreya(),
        subtitle1: GoogleFonts.alegreya(),
        subtitle2: GoogleFonts.alegreya(),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(
        color: Colors.white,
        textStyle: TextStyle(color: Colors.black),
      )
      // bottomSheetTheme:
      //     BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0.8)),
      ),
);
