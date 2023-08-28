import 'package:flutter/material.dart';
import 'package:mycode/models/coffee_shop.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';
import '../widgets/coffee_title.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).removeItemTocart(coffee);
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("delete item"),
    ),);
  }
  void payNow(){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("payment success"),
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
              "Your cart?",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 25),
            // list of coffee to buy
            Expanded(
              child: ListView.builder(
                  itemCount:value.userCart.length,
                  itemBuilder: (context, index){
                    // get individual coffee
                    Coffee eachCoffe = value.userCart[index];
                    return CoffeeTitle(
                      coffee: eachCoffe,
                      onPressed: ()=> removeToCart(eachCoffe) ,
                      icon: Icon(Icons.delete),
                    );
                  }),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(12),),
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: Text(
                  "pay now",
                  style: TextStyle(color: Colors.white),

                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );

  }
}
