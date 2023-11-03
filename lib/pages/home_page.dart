import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/search_page.dart';
import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/recipe_provider.dart';
import 'package:food_recipe_app/widgets/drawer_widget.dart';
import 'package:food_recipe_app/widgets/shimmer_effect_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flash/flash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchQueryController = TextEditingController();

  void getData() async {
    await Provider.of<RecipeProvider>(context, listen: false)
        .getRandomRecipes(context.read<AuthProvider>().accessToken, '5');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> newe() async {
    await Provider.of<RecipeProvider>(context, listen: false)
        .getRandomRecipes(context.read<AuthProvider>().accessToken, '5');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: const DrawerWidget(),
      body: RefreshIndicator.adaptive(
        color: Theme.of(context).primaryColor,
        onRefresh: newe,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              _searchField(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Recipes",
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
              GestureDetector(
                onTap: () {
                  // context.pushNamed(RouterConstants.recipeInfo, pathParameters: )
                },
                child: _popularRecipe(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Editor's Choice",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {},
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
      ),
    );
  }

  SizedBox _popularRecipe() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          if (provider.recipesList.isEmpty) {
            provider.setLoading(true);
          } else {
            provider.setLoading(false);
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.recipesList.length > 0
                ? provider.recipesList.length
                : 10,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 150,
                height: 150,
                child: Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        provider.isLoading
                            ? ShimmerEffectWidget(width: 150, height: 110)
                            : Container(
                                width: 150,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  image: DecorationImage(
                                    image: provider.recipesList[index].img
                                            .toString()
                                            .isNotEmpty
                                        ? NetworkImage(
                                            provider.recipesList[index].img)
                                        : const NetworkImage(
                                            'https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?auto=format&fit=crop&q=80&w=2072&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        provider.isLoading
                            ? ShimmerEffectWidget(width: 100, height: 20)
                            : Text(
                                provider.isLoading
                                    ? ''
                                    : provider.recipesList[index].title,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox _EditorReciepeList() {
    return SizedBox(
      width: double.infinity,
      height: 900,
      child: Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          if (provider.recipesList.isEmpty) {
            provider.setLoading(true);
          } else {
            provider.setLoading(false);
          }
          return ListView.builder(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: provider.recipesList.length > 0
                ? provider.recipesList.length
                : 10,
            itemBuilder: (context, index) {
              var deviceWidth = MediaQuery.of(context).size.width;
              return SizedBox(
                width: double.infinity,
                height: 150,
                child: Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: provider.isLoading
                              ? ShimmerEffectWidget(width: 150, height: 135)
                              : Container(
                                  width: 150,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: provider.recipesList[index].img
                                              .toString()
                                              .isNotEmpty
                                          ? NetworkImage(
                                              provider.recipesList[index].img)
                                          : const NetworkImage(
                                              'https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?auto=format&fit=crop&q=80&w=2072&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: deviceWidth > 400 ? 300 : 130,
                              // height: 75,
                              child: provider.isLoading
                                  ? ShimmerEffectWidget(width: 150, height: 60)
                                  : Text(
                                      provider.isLoading
                                          ? ''
                                          : provider.recipesList[index].title,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                            provider.isLoading
                                ? ShimmerEffectWidget(width: 125, height: 20)
                                : const Row(
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
                                          color: Color.fromARGB(
                                              255, 114, 114, 114),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              RouterConstants.recipeInfo,
                              pathParameters: {
                                'id': provider.recipesList[index].id.toString()
                              },
                            );
                          },
                          child: provider.isLoading
                              ? ShimmerEffectWidget(width: 30, height: 30)
                              : Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
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
            },
          );
        },
      ),
    );
  }

  Padding _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              // width: double.infinity,
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
                  hintText: 'Search Recipe',
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
            width: 8,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SearchPage(searches: provider.recipesList);
                          }),
                        );
                      }
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
                  child: const Icon(
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
        'Food Recipe App',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
    );
  }
}
