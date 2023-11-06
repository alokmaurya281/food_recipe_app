import 'package:flutter/material.dart';
// import 'package:food_recipe_app/routes/router_constants.dart';
import 'package:food_recipe_app/services/auth_provider.dart';
import 'package:food_recipe_app/services/recipe_provider.dart';
import 'package:food_recipe_app/widgets/shimmer_effect_widget.dart';
// import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';

class RecipeInformationPage extends StatefulWidget {
  final String id;
  const RecipeInformationPage({
    super.key,
    required this.id,
  });

  @override
  State<RecipeInformationPage> createState() => _RecipeInformationPageState();
}

class _RecipeInformationPageState extends State<RecipeInformationPage> {
  var ingredientItemCount = 10;
  void recipeInfo() async {
    await Provider.of<RecipeProvider>(context, listen: false)
        .getRecipeFullInfo(widget.id, context.read<AuthProvider>().accessToken);
  }

  // void similarRecipe() async {
  //   await Provider.of<RecipeProvider>(context, listen: false)
  //       .getSimilarRecipes(widget.id, context.read<AuthProvider>().accessToken);
  // }

  @override
  void initState() {
    super.initState();
    recipeInfo();
    // similarRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recipe',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          if (provider.recipeInfo.isEmpty) {
            provider.setLoading(true);
          } else {
            provider.setLoading(false);
          }
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: provider.isLoading
                    ? ShimmerEffectWidget(width: double.infinity, height: 40)
                    : Text(
                        provider.isLoading ? '' : provider.recipeInfo['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
              ),
              provider.isLoading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ShimmerEffectWidget(
                          width: double.infinity, height: 300),
                    )
                  : _recipeImage(provider.recipeInfo['image']),
              const SizedBox(
                height: 30,
              ),
              _recipeFeatures(provider),
              const SizedBox(
                height: 30,
              ),
              _description(provider),
              const SizedBox(
                height: 20,
              ),
              _ingredients(provider),
              const SizedBox(
                height: 20,
              ),
              if (provider.recipeInfo['instructions'].toString().isNotEmpty)
                _instuctions(provider),
              const SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Text(
              //     'Related Recipes',
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.w700,
              //       color: Theme.of(context).colorScheme.secondary,
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () {},
              //   child: _relatedRecipes(),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
            ],
          );
        },
      ),
    );
  }

  Column _instuctions(provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (provider.recipeInfo["instructions"].toString().isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              provider.recipeInfo["instructions"].toString().isNotEmpty
                  ? 'Instructions'
                  : '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: provider.isLoading
              ? ShimmerEffectWidget(width: double.infinity, height: 500)
              : Html(
                  data: '<p>${provider.recipeInfo["instructions"]}</p>',
                  style: {
                    'a': Style(
                      textDecoration: TextDecoration.none,
                      color: const Color.fromRGBO(12, 111, 161, 1),
                    ),
                    'p': Style(
                      fontSize: FontSize(16),
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.justify,
                      color: Theme.of(context).primaryColor,
                    ),
                  },
                ),
        ),
      ],
    );
  }

  Column _description(provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: provider.isLoading
              ? ShimmerEffectWidget(width: double.infinity, height: 400)
              : Html(
                  data: '<p>${provider.recipeInfo["summary"]}</p>',
                  style: {
                    'a': Style(
                      textDecoration: TextDecoration.none,
                      color: const Color.fromRGBO(12, 111, 161, 1),
                    ),
                    'p': Style(
                      fontSize: FontSize(16),
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.justify,
                      color: Theme.of(context).primaryColor,
                    ),
                  },
                ),
        ),
      ],
    );
  }

  Padding _ingredients(provider) {
    // final ingredients = provider.recipeInfo.extendedIngredients;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients (For One Person)',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  'Items',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          provider.isLoading
              ? ShimmerEffectWidget(width: double.infinity, height: 400)
              : SizedBox(
                  width: double.infinity,
                  height: (30.0 *
                      (provider.recipeInfo['extendedIngredients'].length)),
                  child: ListView.builder(
                    itemCount:
                        provider.recipeInfo['extendedIngredients'].length < 0
                            ? 10
                            : provider.recipeInfo['extendedIngredients'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                provider.recipeInfo["extendedIngredients"]
                                    [index]['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                provider.recipeInfo["extendedIngredients"]
                                    [index]['original'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }

  Padding _recipeFeatures(provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  provider.isLoading
                      ? ShimmerEffectWidget(width: 50, height: 50)
                      : Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.currency_rupee,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  provider.isLoading
                      ? ShimmerEffectWidget(width: 100, height: 30)
                      : Text(
                          provider.isLoading
                              ? ''
                              : 'Rs ${provider.recipeInfo["pricePerServing"]} cost Per serving',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  provider.isLoading
                      ? ShimmerEffectWidget(width: 50, height: 50)
                      : Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  provider.isLoading
                      ? ShimmerEffectWidget(width: 100, height: 30)
                      : Text(
                          provider.isLoading ? '' : '100 Likes',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  provider.isLoading
                      ? ShimmerEffectWidget(width: 50, height: 50)
                      : Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.punch_clock,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  provider.isLoading
                      ? ShimmerEffectWidget(width: 100, height: 30)
                      : Text(
                          provider.isLoading
                              ? ''
                              : 'Ready in ${provider.recipeInfo['readyInMinutes']} minutes',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  provider.isLoading
                      ? ShimmerEffectWidget(width: 50, height: 50)
                      : Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  provider.isLoading
                      ? ShimmerEffectWidget(width: 100, height: 30)
                      : Text(
                          provider.isLoading ? '' : '4.5',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _recipeImage(image) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // SizedBox _relatedRecipes() {
  //   return SizedBox(
  //     width: double.infinity,
  //     height: 200,
  //     child: Consumer<RecipeProvider>(
  //       builder: (context, provider, child) {
  //         if (provider.similarRecipeList.isEmpty) {
  //           provider.setLoading(true);
  //         } else {
  //           provider.setLoading(false);
  //         }
  //         return ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: provider.similarRecipeList.length > 0
  //               ? provider.recipesList.length
  //               : 10,
  //           itemBuilder: (context, index) {
  //             return SizedBox(
  //               width: 150,
  //               height: 150,
  //               child: Card(
  //                 margin: const EdgeInsets.all(8),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: GestureDetector(
  //                     onTap: () {
  //                       context.pushNamed(RouterConstants.recipeInfo,
  //                           pathParameters: {
  //                             'id': provider.similarRecipeList[index].id
  //                                 .toString()
  //                           });
  //                     },
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         provider.isLoading
  //                             ? ShimmerEffectWidget(width: 150, height: 100)
  //                             : Container(
  //                                 width: 150,
  //                                 height: 130,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: const BorderRadius.all(
  //                                       Radius.circular(15)),
  //                                   image: DecorationImage(
  //                                     image: NetworkImage(provider
  //                                         .similarRecipeList[index].img),
  //                                     fit: BoxFit.cover,
  //                                   ),
  //                                 ),
  //                               ),
  //                         provider.isLoading
  //                             ? ShimmerEffectWidget(width: 150, height: 20)
  //                             : Text(
  //                                 provider.isLoading
  //                                     ? ''
  //                                     : provider.similarRecipeList[index].title,
  //                                 style: TextStyle(
  //                                   overflow: TextOverflow.ellipsis,
  //                                   fontSize: 14,
  //                                   fontWeight: FontWeight.w600,
  //                                   color:
  //                                       Theme.of(context).colorScheme.secondary,
  //                                 ),
  //                               )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }
}
