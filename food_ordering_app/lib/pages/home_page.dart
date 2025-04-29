import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:food_ordering_app/classes/food_class.dart';
import 'package:food_ordering_app/classes/user_class.dart';
import 'package:food_ordering_app/pages/cart_page.dart';
import 'package:food_ordering_app/widgets/card_widges2.dart';
import 'package:food_ordering_app/widgets/categorie_widget.dart';
import 'package:food_ordering_app/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user1;
  late List<Food> foods;
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    user1 = User();
    foods = user1.jsonData.map((item) => Food.fromJson(item)).toList();
    categories = foods.map((item) => item.category).toList();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Popular Menu")),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(21),
            child: badges.Badge(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPages(user1: user1)));
              },
              badgeContent: Text("${user1.cartNumber}"),
              child: Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(children: []),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            SearchWidget(),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    categories
                        .map(
                          (categoryTitle) =>
                              CategorieWidget(category: categoryTitle),
                        )
                        .toList(),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: foods.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidges2(
                    user: user1,
                    food: foods[index],
                    onFavoriteToggle: () {
                      setState(() {});
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
