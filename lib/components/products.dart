import 'package:flutter/material.dart';
import 'package:sanikumarsahani/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer1",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 500,
      "price": 450,
    },
    {
      "name": "Blazerr",
      "picture": "assets/images/products/blazer2.jpeg",
      "old_price": 600,
      "price": 550,
    },
    {
      "name": "shirt",
      "picture": "assets/images/products/dress1.jpeg",
      "old_price": 50,
      "price": 45,
    },
    {
      "name": "skirt",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 567,
      "price": 666,
    },
    {
      "name": "kurta",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 676,
      "price": 999,
    },
    {
      "name": "slinger",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 300,
      "price": 200,
    },
    {
      "name": "sleeveless",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 900,
      "price": 100,
    },
    {
      "name": "garment",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 123,
      "price": 100,
    },
    {
      "name": "pant",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 999,
      "price": 666,
    },
    {
      "name": "half pant",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 999,
      "price": 222,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:  new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
         }
  }

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
//        tag:new Text("A"),  //if multiple hero error occurs
        tag: prod_name,
        child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              //here we are passing the values of the product page to product details page
              builder: (context)=>new ProductDetails(
            product_detail_name: prod_name,
            product_detail__new_price: prod_price,
            product_detail_old_price: prod_old_price,
            product_detail_picture: prod_picture,
          ))),
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: new Row(children: <Widget>[
                Expanded(
                  child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                ),
                new Text("\$${prod_price }",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
              ],)
              ) ,
            child: Image.asset(prod_picture,
            fit:BoxFit.cover,)),
        ),
      ),),
    );
  }
}

