// ignore_for_file: prefer_final_fields

import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/suggest_feature_provider.dart';
import 'package:provider/provider.dart';

class SuggestFeature extends StatefulWidget {
  const SuggestFeature({super.key});

  @override
  State<SuggestFeature> createState() => _SuggestFeatureState();
}

class _SuggestFeatureState extends State<SuggestFeature> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _featureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suggest Feature',
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
                    hintText: 'Enter Name ',
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
                    hintText: 'Enter Email ',
                    prefixIcon: Icon(Icons.email),
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
                  'Describe Feature',
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
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromARGB(246, 143, 143, 143),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlign: TextAlign.justify,
                  controller: _featureController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Your Feature what you want to suggest!! ',
                    prefixIcon: Icon(
                      Icons.light,
                    ),
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
              child: Consumer<SuggestfeatureProvider>(
                builder: (context, provider, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(239, 11, 116, 182),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      if (_nameController.text.isEmpty &&
                          _emailController.text.isEmpty &&
                          _featureController.text.isEmpty) {
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
                                color: Color.fromARGB(236, 182, 45, 11),
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            margin: const EdgeInsets.all(32.0),
                            clipBehavior: Clip.antiAlias,
                            // showProgressIndicator: true,
                            indicatorColor:
                                const Color.fromARGB(236, 182, 45, 11),
                            icon: const Icon(Icons.error),
                            // title: const Text('Error'),
                            content: Text(
                              'All Fields required',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                      } else {
                        provider.setLoading(true);
                        await provider.sendSuggestionFeature(
                            context.read<AuthProvider>().accessToken,
                            _nameController.text,
                            _emailController.text,
                            _featureController.text);

                        provider.setLoading(false);
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
                                  color: Color.fromARGB(237, 11, 182, 54),
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              margin: const EdgeInsets.all(32.0),
                              clipBehavior: Clip.antiAlias,
                              // showProgressIndicator: true,
                              indicatorColor:
                                  const Color.fromARGB(237, 11, 182, 28),
                              icon: const Icon(Icons.error),
                              // title: const Text('Error'),
                              content: Text(
                                'Feature Suggestion send Successfully',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
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
                                  color: Color.fromARGB(236, 182, 45, 11),
                                  strokeAlign: BorderSide.strokeAlignInside,
                                ),
                              ),
                              margin: const EdgeInsets.all(32.0),
                              clipBehavior: Clip.antiAlias,
                              // showProgressIndicator: true,
                              indicatorColor:
                                  const Color.fromARGB(236, 182, 45, 11),
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
                    child: provider.isLoading ? SizedBox(
                      width: 15,
                      height: 15,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ): const Text(
                      'Submit',
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
            height: 50,
          ),
        ],
      ),
    );
  }
}
