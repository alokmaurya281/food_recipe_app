// ignore_for_file: prefer_final_fields

import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/recipe.dart';
import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/recipe_provider.dart';
import 'package:food_recipe_app/widgets/drawer_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  List<Recipes> searches;
  SearchPage({super.key, required this.searches});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List selectedFilters = [];
  bool isBreakfastfilter = false;
  TextEditingController _searchQueryController = TextEditingController();
  @override
  void initState() {
    super.initState();
    widget.searches = context.read<RecipeProvider>().searchrecipesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            _searchField(),
            const SizedBox(
              height: 20,
            ),
            widget.searches.isEmpty
                ? const Text('')
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search Results",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View all',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
            _EditorReciepeList(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox _EditorReciepeList() {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: widget.searches.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  'No Results Found',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          : ListView.builder(
              // shrinkWrap: true,
              itemCount: widget.searches.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 135,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: widget.searches[index].img
                                        .toString()
                                        .isNotEmpty
                                    ? NetworkImage(widget.searches[index].img)
                                    : const NetworkImage(
                                        'https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?auto=format&fit=crop&q=80&w=2072&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 110,
                                // height: 75,
                                child: Text(
                                  widget.searches[index].title,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/author.jpg'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Alok Maurya',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 114, 114, 114),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterConstants.recipeInfo,
                                  pathParameters: {
                                    'id': widget.searches[index].id.toString(),
                                  });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }

  Padding _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
                border: Border.all(
                  color: const Color.fromRGBO(123, 123, 123, 1),
                ),
              ),
              child: TextFormField(
                controller: _searchQueryController,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Reciepe',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(123, 123, 123, 1),
                    size: 28,
                    weight: 28,
                  ),
                ),
                cursorColor: const Color.fromRGBO(123, 123, 123, 1),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 70,
            height: 50,
            child: Consumer<RecipeProvider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(239, 11, 116, 182),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_searchQueryController.text.isNotEmpty) {
                      provider.searchSetLoading(true);
                      await provider.searchRecipe(_searchQueryController.text,
                          context.read<AuthProvider>().accessToken);

                      // print(provider.error);
                      if (provider.error.isNotEmpty) {
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
                              provider.error.isEmpty
                                  ? 'Error getting data'
                                  : provider.error,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        context.pushNamed(
                          RouterConstants.searchPage,
                        );
                      }
                      provider.searchSetLoading(false);
                    } else {
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
                          indicatorColor:
                              const Color.fromARGB(238, 182, 31, 11),
                          icon: const Icon(Icons.error),
                          // title: const Text('Error'),
                          content: Text(
                            'Please Enter Your Search Query',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: provider.isSearchLoading
                      ? const Center(
                          child: SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator.adaptive()),
                        )
                      : const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 22,
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Search',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
    );
  }
}
