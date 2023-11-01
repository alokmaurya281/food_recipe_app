import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/login_page.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  const SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/author.jpg'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Welcome Alok !',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              )),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.share),
              title: Text(
                'Share App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.rate_review),
              title: Text(
                'Submit Review',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              onTap: () async {
                await context.read<AuthProvider>().signout();
                // ignore: use_build_context_synchronously
                context.showFlash<bool>(
                  // barrierColor: Theme.of(context).primaryColor,
                  barrierDismissible: true,
                  duration: const Duration(seconds: 2),
                  builder: (context, controller) => FlashBar(
                    controller: controller,
                    behavior: FlashBehavior.floating,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      side: BorderSide(
                        color: Color.fromARGB(237, 11, 182, 54),
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                    ),
                    margin: const EdgeInsets.all(32.0),
                    clipBehavior: Clip.antiAlias,
                    // showProgressIndicator: true,
                    indicatorColor: const Color.fromARGB(237, 11, 182, 28),
                    icon: const Icon(Icons.error),
                    // title: const Text('Error'),
                    content: Text(
                      'Signed Out Successfully',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                );
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              },
              title: const Text(
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
