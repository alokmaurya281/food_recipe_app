import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/login_page.dart';
import 'package:food_recipe_app/services/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    // print(themeProvider.themeMode);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.black,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        // colorScheme: ColorScheme.dark(),
        primaryColor: const Color.fromARGB(255, 177, 175, 175),
      ),
      themeAnimationCurve: Curves.bounceInOut,
      themeMode: themeProvider.themeMode,
      home: const LoginPage(),
    );
  }
}
