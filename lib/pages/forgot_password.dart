import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/forgot_pass_account_verify.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Enter Your Registred Email Address we will send you a OTP to verify its your account.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
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
                      if (_emailController.text.isEmpty) {
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
                              'All Fields required!',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                      } else {
                        await provider.forgotPassword(_emailController.text);
                        if (provider.error.isEmpty) {
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
                                  color: Color.fromARGB(235, 39, 182, 11),
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              margin: const EdgeInsets.all(32.0),
                              clipBehavior: Clip.antiAlias,
                              // showProgressIndicator: true,
                              indicatorColor: Color.fromARGB(235, 42, 182, 11),
                              icon: const Icon(Icons.error),
                              // title: const Text('Error'),
                              content: Text(
                                'Otp sent Successfully',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          );
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ForgotPassAccountVerify(
                              email: _emailController.text,
                            );
                          }));
                        } else {
                          await provider.forgotPassword(_emailController.text);
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
                            'Send Email',
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
        ],
      ),
    );
  }
}
