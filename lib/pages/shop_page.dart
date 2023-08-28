import 'package:flutter/material.dart';
import 'package:mycode/models/coffee_shop.dart';
import 'package:mycode/widgets/coffee_title.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add coffee to cart
  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text("successfully added to cart", style: TextStyle(fontSize: 18),),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child)=> SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "How would you like your coffe?",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 25),
            // list of coffee to buy
            Expanded(
              child: ListView.builder(
                  itemCount:value.coffeeShop.length,
                  itemBuilder: (context, index){
                // get individual coffee
                  Coffee eachCoffe = value.coffeeShop[index];
                  return CoffeeTitle(
                    coffee: eachCoffe,
                    onPressed: () => addToCart(eachCoffe),
                    icon: Icon(Icons.add) ,
                  );
              }),
              ),

          ],
        ),
      ),

    ),
    );
  }
}
