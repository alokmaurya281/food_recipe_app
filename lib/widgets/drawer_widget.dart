import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      child: Drawer(
        elevation: 0,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: DrawerHeader(
                  child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/author.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Welcome Alok !',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text(
                'Share App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text(
                'Submit Review',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
