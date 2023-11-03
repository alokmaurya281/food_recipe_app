import 'package:flutter/material.dart';
import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(138, 189, 188, 188),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterConstants.userProfile);
                            },
                            child: const Text(
                              'My Profile',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.security),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterConstants.privacy);
                            },
                            child: const Text(
                              'Privacy',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // const Row(
                      //   children: [
                      //     Icon(Icons.delete),
                      //     SizedBox(
                      //       width: 16,
                      //     ),
                      //     Text(
                      //       'Delete Account',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w700,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.notifications),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterConstants.notifications);
                            },
                            child: const Text(
                              'Notifications',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Support & About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(138, 189, 188, 188),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.policy),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Terms & Poilcy',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.help),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterConstants.help);
                            },
                            child: const Text(
                              'Help and Support',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Actions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(138, 189, 188, 188),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.report),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterConstants.reportProblem);
                            },
                            child: const Text(
                              'Report a Problem',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.display_settings),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterConstants.changeTheme);
                            },
                            child: const Text(
                              'Change Theme',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.info),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterConstants.suggestFeature);
                            },
                            child: const Text(
                              'Suggest a Feature',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // Row(
                      //   children: [
                      //     const Icon(Icons.logout),
                      //     const SizedBox(
                      //       width: 16,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () async {
                      //         await context.read<AuthProvider>().signout();
                      //         // ignore: use_build_context_synchronously
                      //         context.showFlash<bool>(
                      //           // barrierColor: Theme.of(context).primaryColor,
                      //           barrierDismissible: true,
                      //           duration: const Duration(seconds: 2),
                      //           builder: (context, controller) => FlashBar(
                      //             controller: controller,
                      //             behavior: FlashBehavior.floating,
                      //             shape: const RoundedRectangleBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(16)),
                      //               side: BorderSide(
                      //                 color: Color.fromARGB(237, 11, 182, 54),
                      //                 strokeAlign: BorderSide.strokeAlignInside,
                      //               ),
                      //             ),
                      //             margin: const EdgeInsets.all(32.0),
                      //             clipBehavior: Clip.antiAlias,
                      //             // showProgressIndicator: true,
                      //             indicatorColor:
                      //                 const Color.fromARGB(237, 11, 182, 28),
                      //             icon: const Icon(Icons.error),
                      //             // title: const Text('Error'),
                      //             content: Text(
                      //               'Signed Out Successfully',
                      //               style: TextStyle(
                      //                 color: Theme.of(context)
                      //                     .colorScheme
                      //                     .secondary,
                      //               ),
                      //             ),
                      //           ),
                      //         );

                      //       },
                      //       child: const Text(
                      //         'Logout',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w700,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
