import 'package:flutter/material.dart';

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
                const Text(
                  'Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(138, 189, 188, 188),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(Icons.security),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Privacy',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Delete Account',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(Icons.notifications),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
