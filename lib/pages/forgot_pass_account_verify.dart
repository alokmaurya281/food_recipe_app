import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/reset_password_page.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPassAccountVerify extends StatefulWidget {
  final email;
  const ForgotPassAccountVerify({
    super.key,
    required this.email,
  });

  @override
  State<ForgotPassAccountVerify> createState() =>
      _ForgotPassAccountVerifyState();
}

class _ForgotPassAccountVerifyState extends State<ForgotPassAccountVerify> {
  TextEditingController _field1Controller = TextEditingController();
  TextEditingController _field2Controller = TextEditingController();

  TextEditingController _field3Controller = TextEditingController();

  TextEditingController _field4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter OTP Code',
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
              'We have sent you a OTP on your email address please enter correct OTP to verify your Account.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromARGB(246, 143, 143, 143),
                    ),
                  ),
                  child: TextFormField(
                    controller: _field1Controller,
                    autofocus: true,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    cursorColor: const Color.fromARGB(246, 143, 143, 143),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 60,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromARGB(246, 143, 143, 143),
                    ),
                  ),
                  child: TextFormField(
                    controller: _field2Controller,
                    autofocus: true,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    cursorColor: const Color.fromARGB(246, 143, 143, 143),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 60,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromARGB(246, 143, 143, 143),
                    ),
                  ),
                  child: TextFormField(
                    controller: _field3Controller,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    cursorColor: const Color.fromARGB(246, 143, 143, 143),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 60,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromARGB(246, 143, 143, 143),
                    ),
                  ),
                  child: TextFormField(
                    controller: _field4Controller,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    cursorColor: const Color.fromARGB(246, 143, 143, 143),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't recieve OTP? ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              )),
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
                      final enteredOtp = _field1Controller.text +
                          _field2Controller.text +
                          _field3Controller.text +
                          _field4Controller.text;
                      provider.setLoading(true);
                      final isVerified = await provider.accountVerify(
                          enteredOtp, widget.email);
                      if (isVerified) {
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
                                color: Color.fromARGB(235, 11, 182, 19),
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            margin: const EdgeInsets.all(32.0),
                            clipBehavior: Clip.antiAlias,
                            // showProgressIndicator: true,
                            indicatorColor: Color.fromARGB(235, 17, 182, 11),
                            icon: const Icon(Icons.error),
                            // title: const Text('Error'),
                            content: Text(
                              'Account Verified..',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return ResetPasswordPage(
                            email: widget.email,
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
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                      }
                      provider.setLoading(false);
                    },
                    child: context.read<AuthProvider>().isLoading
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          )
                        : const Text(
                            'Verify',
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
