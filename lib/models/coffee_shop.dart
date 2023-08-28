import 'package:flutter/material.dart';
import 'package:mycode/pages/cart_page.dart';
import 'coffee.dart';


class CoffeeShop extends ChangeNotifier{
  // coffee for sale list
    final List<Coffee> _shop=[
      //black coffee
      Coffee(
        name: 'long Black',
        price: '4.10',
        imagePath:'assets/images/cup.png'
      ),
      Coffee(
          name: 'latte',
          price: '4.10',
          imagePath:'assets/images/coffee-cup.png'
      ),
      Coffee(
          name: 'Blue coffee',
          price: '4.10',
          imagePath:'assets/images/blue-coffee.png'
      ),
      Coffee(
          name: 'brown coffee',
          price: '4.10',
          imagePath:'assets/images/brown-coffee.png'
      ),
    ];
  //user cart
    List<Coffee> _userCart =[];

  //get coffee list
    List<Coffee> get coffeeShop => _shop;
  //get user Cart
    List<Coffee> get userCart => _userCart;
  //add item to cart
      void addItemToCart(Coffee coffee){
      _userCart.add(coffee);
      notifyListeners();
    }
  //remove from cart
    void removeItemTocart(Coffee coffee){
      _userCart.remove(coffee);

      notifyListeners();
    }
}