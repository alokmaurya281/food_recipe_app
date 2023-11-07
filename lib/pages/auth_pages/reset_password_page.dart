// ignore_for_file: prefer_final_fields

import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final email;
  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isShow1 = false;
  bool isShow2 = false;

  TextEditingController _pass1Controller = TextEditingController();
  TextEditingController _pass2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromARGB(246, 143, 143, 143),
                  ),
                ),
                child: TextFormField(
                  controller: _pass1Controller,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  obscureText: !isShow1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter New Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShow1 = !isShow1;
                        });
                      },
                      child: Icon(isShow1
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined),
                    ),
                  ),
                  cursorColor: const Color.fromARGB(246, 143, 143, 143),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromARGB(246, 143, 143, 143),
                  ),
                ),
                child: TextFormField(
                  controller: _pass2Controller,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShow2 = !isShow2;
                        });
                      },
                      child: Icon(isShow2
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined),
                    ),
                  ),
                  obscureText: !isShow2,
                  cursorColor: const Color.fromARGB(246, 143, 143, 143),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(239, 11, 116, 182),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      if (_pass1Controller.text == _pass2Controller.text &&
                          _pass1Controller.text.isNotEmpty &&
                          _pass2Controller.text.isNotEmpty) {
                        provider.setLoading(true);
                        bool isChnaged = await provider.resetPassword(
                            widget.email, _pass1Controller.text);
                        if (isChnaged && provider.error.isEmpty) {
                          // ignore: use_build_context_synchronously
                          context.showFlash<bool>(
                            // barrierColor: Theme.of(context).primaryColor,
                            barrierDismissible: true,
                            duration: const Duration(seconds: 2),
                            builder: (context, controller) => FlashBar(
                              controller: controller,
                              behavior: FlashBehavior.floating,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                side: BorderSide(
                                  color: Color.fromARGB(235, 45, 182, 11),
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              margin: const EdgeInsets.all(32.0),
                              clipBehavior: Clip.antiAlias,
                              // showProgressIndicator: true,
                              indicatorColor: const Color.fromARGB(235, 71, 182, 11),
                              icon: const Icon(Icons.error),
                              // title: const Text('Error'),
                              content: Text(
                                'Password Changed successfully',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          );
                          await provider.signout();
                          // ignore: use_build_context_synchronously
                          GoRouter.of(context)
                              .pushReplacementNamed(RouterConstants.login);
                        } else {
                          // ignore: use_build_context_synchronously
                          context.showFlash<bool>(
                            // barrierColor: Theme.of(context).primaryColor,
                            barrierDismissible: true,
                            duration: const Duration(seconds: 2),
                            builder: (context, controller) => FlashBar(
                              controller: controller,
                              behavior: FlashBehavior.floating,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                side: BorderSide(
                                  color: Color.fromARGB(235, 182, 34, 11),
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              margin: const EdgeInsets.all(32.0),
                              clipBehavior: Clip.antiAlias,
                              // showProgressIndicator: true,
                              indicatorColor: const Color.fromARGB(235, 182, 57, 11),
                              icon: const Icon(Icons.error),
                              // title: const Text('Error'),
                              content: Text(
                                provider.error,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          );
                        }
                        provider.setLoading(false);
                      } else {
                        context.showFlash<bool>(
                          // barrierColor: Theme.of(context).primaryColor,
                          barrierDismissible: true,
                          duration: const Duration(seconds: 2),
                          builder: (context, controller) => FlashBar(
                            controller: controller,
                            behavior: FlashBehavior.floating,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              side: BorderSide(
                                color: Color.fromARGB(235, 182, 34, 11),
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            margin: const EdgeInsets.all(32.0),
                            clipBehavior: Clip.antiAlias,
                            // showProgressIndicator: true,
                            indicatorColor: const Color.fromARGB(235, 182, 57, 11),
                            icon: const Icon(Icons.error),
                            // title: const Text('Error'),
                            content: Text(
                              'Password Not matched',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: provider.isLoading
                        ? SizedBox(
                            width: 15,
                            height: 15,
                            child: Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          )
                        : const Text(
                            'Reset',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
