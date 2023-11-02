import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/edit_profile_page.dart';
import 'package:food_recipe_app/pages/settings_page.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/user_provider.dart';
import 'package:food_recipe_app/widgets/drawer_widget.dart';
import 'package:food_recipe_app/widgets/shimmer_effect_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Profile',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SettingsPage();
                }));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.settings),
              ),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<UserProvider>(
                builder: (context, provider, child) {
                  provider.userProfileByEmail(
                      context.read<AuthProvider>().accessToken);
                  if (provider.user.isEmpty) {
                    provider.setLoading(true);
                  } else {
                    provider.setLoading(false);
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      provider.isLoading
                          ? ShimmerEffectWidget(width: 150, height: 150)
                          : Stack(
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            239, 11, 116, 182),
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: CircleAvatar(
                                      backgroundImage: provider.user['image']
                                              .toString()
                                              .isNotEmpty
                                          ? NetworkImage(provider.user['image'])
                                          : const NetworkImage(
                                              'https://images.unsplash.com/photo-1511367461989-f85a21fda167?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHBlcnNvbiUyMHBuZ3xlbnwwfHwwfHx8MA%3D%3D')),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.camera_enhance,
                                      color: Color.fromARGB(255, 52, 173, 8),
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                      const SizedBox(
                        height: 8,
                      ),
                      provider.isLoading
                          ? ShimmerEffectWidget(width: 100, height: 40)
                          : Text(
                              provider.isLoading ? '' : provider.user['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (provider.user['email'].toString().isNotEmpty)
                        provider.isLoading
                            ? ShimmerEffectWidget(width: 100, height: 40)
                            : Text(
                                provider.isLoading
                                    ? ''
                                    : provider.user['email'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (provider.user['about'].toString().isNotEmpty)
                        provider.isLoading
                            ? ShimmerEffectWidget(width: 100, height: 40)
                            : Text(
                                provider.isLoading
                                    ? ''
                                    : provider.user['about'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (provider.user['mobile'].toString().isNotEmpty)
                        provider.isLoading
                            ? ShimmerEffectWidget(width: 100, height: 40)
                            : Text(
                                provider.isLoading
                                    ? ''
                                    : provider.user['mobile'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (provider.user['address'].toString().isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            provider.isLoading
                                ? ShimmerEffectWidget(width: 100, height: 40)
                                : const Icon(
                                    Icons.pin_drop,
                                    color: Colors.grey,
                                  ),
                            Text(
                              provider.isLoading
                                  ? ''
                                  : '${provider.user["address"]}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            )
                          ],
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45,
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return EditProfilePage(
                                          userData: provider.user,
                                        );
                                      },
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(239, 11, 116, 182),
                                ),
                                child: const Text(
                                  'Edit Profile',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ));
  }
}
