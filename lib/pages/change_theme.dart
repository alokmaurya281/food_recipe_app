import 'package:flutter/material.dart';
import 'package:food_recipe_app/services/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Theme',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            activeColor: const Color.fromARGB(255, 16, 159, 241),
            title: const Text(
              'Light Theme',
            ),
            value: ThemeMode.light,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            activeColor: const Color.fromARGB(255, 16, 159, 241),
            title: const Text(
              'Dark Theme',
            ),
            value: ThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            activeColor: const Color.fromARGB(255, 16, 159, 241),
            title: const Text(
              'System Theme',
            ),
            value: ThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          )
        ],
      ),
    );
  }
}
