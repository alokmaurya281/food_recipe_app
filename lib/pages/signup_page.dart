import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/login_page.dart';
import 'package:food_recipe_app/pages/main_screen.dart';
import 'package:food_recipe_app/pages/otp_page.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  bool passShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
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
                  'Username',
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
                  controller: _usernameController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Username',
                    prefixIcon: Icon(Icons.person),
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
                  'Name',
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
                  controller: _nameController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Name',
                    prefixIcon: Icon(Icons.person),
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
                      if (_emailController.text.isEmpty &&
                          _passwordController.text.isEmpty &&
                          _usernameController.text.isEmpty &&
                          _nameController.text.isEmpty) {
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
                                color: Color.fromARGB(236, 182, 14, 11),
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            margin: const EdgeInsets.all(32.0),
                            clipBehavior: Clip.antiAlias,
                            // showProgressIndicator: true,
                            indicatorColor:
                                const Color.fromARGB(236, 182, 57, 11),
                            icon: const Icon(Icons.error),
                            // title: const Text('Error'),
                            content: Text(
                              'All Fields Required',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                      } else {
                        provider.setLoading(true);

                        // print(context.read<AuthProvider>().isLoading);
                        await provider.signup(
                            _emailController.text,
                            _passwordController.text,
                            _usernameController.text,
                            _nameController.text);
                        provider.setLoading(false);

                        // ignore: use_build_context_synchronously
                        if (provider.error.isEmpty) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return OtpPage(
                              email: provider.user.email,
                            );
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
                                  color: Color.fromARGB(236, 182, 14, 11),
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              margin: const EdgeInsets.all(32.0),
                              clipBehavior: Clip.antiAlias,
                              // showProgressIndicator: true,
                              indicatorColor:
                                  const Color.fromARGB(236, 182, 57, 11),
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
                            'Signup',
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(238, 200, 52, 11),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () async {
                  await context.read<AuthProvider>().signInWithGoogle('Google');
                  if (context.read<AuthProvider>().error.isEmpty &&
                      context.read<AuthProvider>().user!.email.isNotEmpty) {
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
                          'Signed Up Successfully',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    );
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
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          side: BorderSide(
                            color: Color.fromARGB(238, 182, 34, 11),
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                        ),
                        margin: const EdgeInsets.all(32.0),
                        clipBehavior: Clip.antiAlias,
                        // showProgressIndicator: true,
                        indicatorColor: const Color.fromARGB(238, 182, 31, 11),
                        icon: const Icon(Icons.error),
                        // title: const Text('Error'),
                        content: Text(
                          context.read<AuthProvider>().error,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Continue with Google',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
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
                  "Already Have an account ? ",
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
                      return const LoginPage();
                    }));
                  },
                  child: Text(
                    'Login',
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
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
