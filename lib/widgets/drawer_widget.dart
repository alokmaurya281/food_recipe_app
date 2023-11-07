import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/user_provider.dart';
import 'package:food_recipe_app/widgets/shimmer_effect_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  void userData() async {
    await Provider.of<UserProvider>(context, listen: false)
        .userProfileByEmail(context.read<AuthProvider>().accessToken);
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

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
              child: Consumer<UserProvider>(
                builder: (context, provider, child) {
                  if (provider.user.isEmpty) {
                    provider.setLoading(true);
                  } else {
                    provider.setLoading(false);
                  }
                  return DrawerHeader(
                    child: Row(
                      children: [
                        provider.isLoading
                            ? ShimmerEffectWidget(width: 60, height: 60)
                            : SizedBox(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                  backgroundImage: provider.user['image']
                                          .toString()
                                          .isNotEmpty
                                      ? NetworkImage(provider.user['image'])
                                      : const NetworkImage(
                                          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHBlcnNvbiUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D'),
                                ),
                              ),
                        const SizedBox(
                          width: 20,
                        ),
                        provider.isLoading
                            ? ShimmerEffectWidget(width: 100, height: 40)
                            : Text(
                                provider.isLoading ? '' : provider.user['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                      ],
                    ),
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              onTap: () {
                context.goNamed(RouterConstants.home);
              },
              title: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              onTap: () {
                Share.share(
                    'Download Food Recipe App from https://alokmaurya281.github.io/food-recipe-web/app-release.apk  And Get Exiciting Recipies......',
                    subject:
                        'Food Recipe App Download App to get interesting Recipes!');
              },
              title: const Text(
                'Share App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                context.pushNamed(RouterConstants.reportProblem);
              },
              leading: const Icon(Icons.error),
              title: const Text(
                'Report Problem',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              onTap: () {
                context.pushNamed(RouterConstants.settings);
              },
              title: const Text(
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
                GoRouter.of(context)
                    .pushReplacementNamed(RouterConstants.login);
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
