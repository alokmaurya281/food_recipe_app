import 'package:flutter/material.dart';
// import 'package:food_recipe_app/pages/login_page.dart';
// import 'package:food_recipe_app/pages/main_screen.dart';
import 'package:food_recipe_app/routes/router.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/connectivity_provider.dart';
import 'package:food_recipe_app/services/filter_provider.dart';
import 'package:food_recipe_app/services/recipe_provider.dart';
import 'package:food_recipe_app/services/report_provider.dart';
import 'package:food_recipe_app/services/suggest_feature_provider.dart';
import 'package:food_recipe_app/services/support_provider.dart';
import 'package:food_recipe_app/services/theme_provider.dart';
import 'package:food_recipe_app/services/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

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
        ChangeNotifierProvider(
          create: (context) => ReportProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SupportProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SuggestfeatureProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
      ],
      child: MyApp(sharedPreferences: sharedPreferences),
    ),
  );
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({
    super.key,
    required this.sharedPreferences,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void check() async {
    await context
        .read<AuthProvider>()
        .isTokenValid(context.read<AuthProvider>().accessToken);
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    // final authProvider =
    // context.watch<AuthProvider>(); // print(themeProvider.themeMode);
    return MaterialApp.router(
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
      routerConfig: AppRouter().router,
      // routeInformationParser: AppRouter().router.routeInformationParser,
      // routerDelegate: AppRouter().router.routerDelegate,
      // home: authProvider.isLoggedIn && authProvider.accessToken.isNotEmpty
      //     ? const MainScreen()
      //     : const LoginPage(),
    );
  }
}
