import 'package:flutter/material.dart';
import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:food_recipe_app/services/connectivity_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class InternetNotConnected extends StatefulWidget {
  const InternetNotConnected({super.key});

  @override
  State<InternetNotConnected> createState() => _InternetNotConnectedState();
}

class _InternetNotConnectedState extends State<InternetNotConnected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 200,
              height: 200,
              child: Image(
                image: AssetImage('assets/images/no_internet.gif'),
              ),
            ),
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Consumer<ConnectivityProvider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(239, 11, 116, 182),
                  ),
                  onPressed: () async {
                    await provider.checkConnectivity();
                    if (provider.internetConnected) {
                      // ignore: use_build_context_synchronously
                      context.goNamed(RouterConstants.home);
                    }
                  },
                  child: const Text(
                    'Refresh',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
