import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/forgot_password.dart';
import 'package:food_recipe_app/pages/main_screen.dart';
import 'package:food_recipe_app/pages/signup_page.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool passShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
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
                  'Email',
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
                  controller: _emailController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter email address',
                    prefixIcon: Icon(Icons.email_outlined),
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
                  controller: _passwordController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          passShow = !passShow;
                        });
                      },
                      child: Icon(passShow
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined),
                    ),
                  ),
                  obscureText: !passShow,
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
                      provider.setLoading(true);
                      if (_emailController.text.isEmpty &&
                          _passwordController.text.isEmpty) {
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
                                color: Color.fromARGB(236, 182, 34, 11),
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            margin: const EdgeInsets.all(32.0),
                            clipBehavior: Clip.antiAlias,
                            // showProgressIndicator: true,
                            indicatorColor: Color.fromARGB(236, 182, 11, 11),
                            icon: const Icon(Icons.error),
                            // title: const Text('Error'),
                            content: Text(
                              'Please Fill all the fields',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                      } else {
                        await provider.login(
                            _emailController.text, _passwordController.text);
                        if (provider.error.isEmpty &&
                            provider.accessToken.isNotEmpty) {
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
                                  color: Color.fromARGB(235, 42, 182, 11),
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              margin: const EdgeInsets.all(32.0),
                              clipBehavior: Clip.antiAlias,
                              // showProgressIndicator: true,
                              indicatorColor: Color.fromARGB(235, 25, 182, 11),
                              icon: const Icon(Icons.error),
                              // title: const Text('Error'),
                              content: Text(
                                'Signed in successfully',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          );
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return const MainScreen();
                          }));
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
                                  color: Color.fromARGB(236, 182, 34, 11),
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              margin: const EdgeInsets.all(32.0),
                              clipBehavior: Clip.antiAlias,
                              // showProgressIndicator: true,
                              indicatorColor: Color.fromARGB(236, 182, 11, 11),
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
                      }
                      provider.setLoading(false);
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
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ForgotPasswordPage();
                  }));
                },
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                'Or Continue with',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(246, 143, 143, 143),
                ),
              ),
            ),
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
                      backgroundColor: const Color.fromARGB(238, 200, 52, 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      provider.setLoading(true);
                      await provider.signInWithGoogle('Google');
                      if (provider.error.isEmpty &&
                          provider.user!.email.isNotEmpty) {
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
                                color: Color.fromARGB(237, 11, 182, 54),
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            margin: const EdgeInsets.all(32.0),
                            clipBehavior: Clip.antiAlias,
                            // showProgressIndicator: true,
                            indicatorColor: Color.fromARGB(237, 11, 182, 28),
                            icon: const Icon(Icons.error),
                            // title: const Text('Error'),
                            content: Text(
                              'Signed in Successfully',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                        provider.setLoading(false);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const MainScreen();
                        }));
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
                                color: Color.fromARGB(238, 182, 34, 11),
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            margin: const EdgeInsets.all(32.0),
                            clipBehavior: Clip.antiAlias,
                            // showProgressIndicator: true,
                            indicatorColor:
                                const Color.fromARGB(238, 182, 31, 11),
                            icon: const Icon(Icons.error),
                            // title: const Text('Error'),
                            content: Text(
                              provider.error,
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
                            'Continue with Google',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(237, 5, 75, 214),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: const Text(
                  'Continue with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          // Spacer(),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Don't Have an account ? ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(246, 143, 143, 143),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const SignupPage();
                    }));
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
