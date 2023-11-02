import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/login_page.dart';
import 'package:food_recipe_app/pages/main_screen.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/filter_provider.dart';
import 'package:food_recipe_app/services/recipe_provider.dart';
import 'package:food_recipe_app/services/theme_provider.dart';
import 'package:food_recipe_app/services/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void token() async {
    await Provider.of<AuthProvider>(context, listen: false).getToken();
  }

  @override
  void initState() {
    super.initState();
    token();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final authProvider =
        context.watch<AuthProvider>(); // print(themeProvider.themeMode);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.black,
        colorScheme: const ColorScheme.light(
          secondary: Colors.black,
        ),
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        // colorScheme: ColorScheme.dark(),
        primaryColor: const Color.fromARGB(255, 171, 171, 171),
        colorScheme: const ColorScheme.dark(
          secondary: Colors.white,
        ),
      ),
      themeAnimationCurve: Curves.bounceInOut,
      themeMode: themeProvider.themeMode,
      home: authProvider.isLoggedIn && authProvider.accessToken.isNotEmpty
          ? const MainScreen()
          : const LoginPage(),
    );
  }
}
