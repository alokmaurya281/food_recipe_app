import 'package:flutter/material.dart';

class ReportProblem extends StatefulWidget {
  const ReportProblem({super.key});

  @override
  State<ReportProblem> createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblem> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report Problem ',
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
                  'Describe Issue',
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
                  controller: _problemController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Problem ',
                    prefixIcon: Icon(
                      Icons.report,
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(239, 11, 116, 182),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  // if (provider.error.isEmpty) {
                  //   // ignore: use_build_context_synchronously
                  //   context.showFlash<bool>(
                  //     // barrierColor: Theme.of(context).primaryColor,
                  //     barrierDismissible: true,
                  //     duration: const Duration(seconds: 2),
                  //     builder: (context, controller) => FlashBar(
                  //       controller: controller,
                  //       behavior: FlashBehavior.floating,
                  //       shape: const RoundedRectangleBorder(
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(16)),
                  //         side: BorderSide(
                  //           color: Color.fromARGB(237, 11, 182, 54),
                  //           strokeAlign: BorderSide.strokeAlignInside,
                  //         ),
                  //       ),
                  //       margin: const EdgeInsets.all(32.0),
                  //       clipBehavior: Clip.antiAlias,
                  //       // showProgressIndicator: true,
                  //       indicatorColor:
                  //           const Color.fromARGB(237, 11, 182, 28),
                  //       icon: const Icon(Icons.error),
                  //       // title: const Text('Error'),
                  //       content: Text(
                  //         'Profile Updated Successfully',
                  //         style: TextStyle(
                  //           color: Theme.of(context).colorScheme.secondary,
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  //   // ignore: use_build_context_synchronously

                  // } else {
                  //   // ignore: use_build_context_synchronously
                  //   context.showFlash<bool>(
                  //     // barrierColor: Theme.of(context).primaryColor,
                  //     barrierDismissible: true,
                  //     duration: const Duration(seconds: 2),
                  //     builder: (context, controller) => FlashBar(
                  //       controller: controller,
                  //       behavior: FlashBehavior.floating,
                  //       shape: const RoundedRectangleBorder(
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(16)),
                  //         side: BorderSide(
                  //           color: Color.fromARGB(236, 182, 45, 11),
                  //           strokeAlign: BorderSide.strokeAlignInside,
                  //         ),
                  //       ),
                  //       margin: const EdgeInsets.all(32.0),
                  //       clipBehavior: Clip.antiAlias,
                  //       // showProgressIndicator: true,
                  //       indicatorColor:
                  //           const Color.fromARGB(236, 182, 45, 11),
                  //       icon: const Icon(Icons.error),
                  //       // title: const Text('Error'),
                  //       content: Text(
                  //         provider.error,
                  //         style: TextStyle(
                  //           color: Theme.of(context).colorScheme.secondary,
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // }
                },

                // SizedBox(
                //   width: 15,
                //   height: 15,
                //   child: Center(
                //     child: CircularProgressIndicator.adaptive(
                //       backgroundColor:
                //           Theme.of(context).colorScheme.secondary,
                //     ),
                //   ),
                // )
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
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
