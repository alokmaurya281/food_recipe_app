import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/edit_profile_page.dart';
import 'package:food_recipe_app/pages/settings_page.dart';
import 'package:food_recipe_app/widgets/drawer_widget.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(239, 11, 116, 182),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(100)),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/author.jpg'),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Alok Maurya',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Hi Im alok and im a passinate software developer. And I love listening music.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pin_drop,
                        color: Colors.grey,
                      ),
                      Text(
                        'Noida, India',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
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
                                    return const EditProfilePage();
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // SizedBox(
                      //   height: 45,
                      //   width: 150,
                      //   child: ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor:
                      //             const Color.fromARGB(239, 11, 116, 182),
                      //       ),
                      //       child: Text(
                      //         'Edit Profile',
                      //         textAlign: TextAlign.center,
                      //         style:
                      //             TextStyle(color: Colors.white, fontSize: 16),
                      //       )),
                      // )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
