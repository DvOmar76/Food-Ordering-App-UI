import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:food_ordering_app/classes/food_class.dart';
import 'package:food_ordering_app/classes/user_class.dart';
import 'package:food_ordering_app/widgets/card_widges2.dart';

class CartPages extends StatelessWidget {
  const CartPages({super.key, required this.user1});
  final User user1;

  @override
  Widget build(BuildContext context) {
    List<Food> foods = user1.favorite.map((item) => item).toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Popular Menu")),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(21),
            child: badges.Badge(
              onTap: () {
                MaterialPageRoute(
                  builder: (context) => CartPages(user1: user1),
                );
              },
              badgeContent: Text("${user1.cartNumber}"),
              child: Icon(Icons.favorite_sharp),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
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
                    onFavoriteToggle: () {},
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
