import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/user_provider.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  final Map<String, dynamic> userData;
  const EditProfilePage({
    super.key,
    required this.userData,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();

  TextEditingController _mobileController = TextEditingController();

  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userData['name'];
    _aboutController.text = widget.userData['about'];
    _mobileController.text = widget.userData['mobile'];
    _addressController.text = widget.userData['address'];
    _cityController.text = widget.userData['city'];
    _stateController.text = widget.userData['state'];
    _countryController.text = widget.userData['country'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile ',
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
                  'About',
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
                  controller: _aboutController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter About Yourself',
                    prefixIcon: Icon(Icons.description),
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
                  'Mobile',
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
                  controller: _mobileController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Mobile No.',
                    prefixIcon: Icon(Icons.phone),
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
                  'Address',
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
                  controller: _addressController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Your Address',
                    prefixIcon: Icon(Icons.pin_drop),
                  ),
                  cursorColor: const Color.fromARGB(246, 143, 143, 143),
                ),
              ),
            ],
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
                  'City',
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
                  controller: _cityController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Your City',
                    prefixIcon: Icon(Icons.pin_drop),
                  ),
                  cursorColor: const Color.fromARGB(246, 143, 143, 143),
                ),
              ),
            ],
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
                  'State',
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
                  controller: _stateController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Your State',
                    prefixIcon: Icon(Icons.pin_drop),
                  ),
                  cursorColor: const Color.fromARGB(246, 143, 143, 143),
                ),
              ),
            ],
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
                  'Country',
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
                  controller: _countryController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Your Country',
                    prefixIcon: Icon(Icons.pin_drop),
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
              child: Consumer<UserProvider>(
                builder: (context, provider, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(239, 11, 116, 182),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      provider.setLoading(true);
                      final fields = {
                        'id': widget.userData['_id'],
                        'name': _nameController.text,
                        'about': _aboutController.text,
                        'mobile': _mobileController.text,
                        'address': _addressController.text,
                        'city': _cityController.text,
                        'state': _stateController.text,
                        'country': _countryController.text,
                      };

                      await provider.updateUserProfile(
                          context.read<AuthProvider>().accessToken, fields);
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
                              'Profile Updated Successfully',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
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
                            'Save',
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
