import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/recipe_information_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                  const Text(
                    "Search Results",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View all',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
      height: 900,
      child: ListView.builder(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
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
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/pizza.jpeg')),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 110,
                            // height: 75,
                            child: Text(
                              'Easy Pizza Reciepehjfjjfjfdjshhjhjhjhjhh',
                              softWrap: true,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/author.jpg'),
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
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const RecipeInformationPage();
                          }));
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
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
          SizedBox(
            width: 70,
            height: 50,
            child: ElevatedButton(
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
              onPressed: () {},
              child: const Icon(
                Icons.filter_list,
                color: Colors.white,
                size: 22,
              ),
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
