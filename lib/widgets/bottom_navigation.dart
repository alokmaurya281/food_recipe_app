import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/home_page.dart';
import 'package:food_recipe_app/pages/search_page.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  List<Widget> pages = [
    const HomePage(),
    SearchPage(
      searches: [],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
