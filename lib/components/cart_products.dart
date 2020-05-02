import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_in_the_cart = [
    {
      "name": "shirt",
      "picture": "assets/images/products/dress1.jpeg",
      "price": 45,
      "size": "M",
      "color": "red",
      "Quantity": 1,
    },
    {
      "name": "pant",
      "picture": "assets/images/products/dress2.jpeg",
      "price": 666,
      "size": "M",
      "color": "red",
      "Quantity": 1,
    },
    {
      "name": "jeans",
      "picture": "assets/images/products/dress1.jpeg",
      "price": 45,
      "size": "M",
      "color": "red",
      "Quantity": 1,
    },
    {
      "name": "blazer",
      "picture": "assets/images/products/dress2.jpeg",
      "price": 666,
      "size": "M",
      "color": "red",
      "Quantity": 1,
    },
    {
      "name": "shirt",
      "picture": "assets/images/products/dress1.jpeg",
      "price": 45,
      "size": "M",
      "color": "red",
      "Quantity": 1,
    },
    {
      "name": "skirt",
      "picture": "assets/images/products/dress2.jpeg",
      "price": 666,
      "size": "M",
      "color": "red",
      "Quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_in_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_in_the_cart[index]["name"],
            cart_prod_color: Products_in_the_cart[index]["color"],
            cart_prod_picture: Products_in_the_cart[index]["picture"],
            cart_prod_price: Products_in_the_cart[index]["price"],
            cart_prod_qty: Products_in_the_cart[index]["Quantity"],
            cart_prod_size: Products_in_the_cart[index]["size"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_color,
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_qty,
    this.cart_prod_size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //================FOR THE PRODUCT IMAGE TO APPEAR IN THE CART SECTION==========================
        leading: new Image.asset(
          cart_prod_picture,
          width: 80.0,
           height: 80, //  set the height of the product image in the cart
          //  scale: 0.4,
          
             

        ),
        //=========================FOR THE PRODUCT NAME TO APPEAR IN THE CART SECTION======================
        title: new Text(cart_prod_name),
        //=============================SUBTITLE SECTION=======================
        subtitle: Column(
          children: <Widget>[
            //====ROW INSIDE COLUMN===========
            Row(
              children: <Widget>[
                //=================THIS SECTIOIN IS FOR THE SIZE OF THE PRODUCT==============================
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                //this section is for the size of the product================
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_size,
                      style: TextStyle(color: Colors.red)),
                ),
                //==================THIS SECTION IS FOR THE COLOR OF THE CART=============================
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),

                //======THIS SECTION IF FOR THE PRODUCT COLOR=========================================
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Text(cart_prod_color,
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
//==================THIS SECTION IS FOR THE PRODUCT PRICE========================================
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),         
          ],
        ),
         trailing: new Column(
          children: <Widget>[
             Icon(Icons.arrow_drop_up, size: 20.0, color: Colors.pink),
              new Text("$cart_prod_qty"),
             Icon(Icons.arrow_drop_down, size: 17.0, color: Colors.purple,),
       
          ],
        ),
      ),
    );
  }

  
}
