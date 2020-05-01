import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail__new_price;
  final product_detail_old_price;
  final product_detail_picture;

  const ProductDetails({
    this.product_detail_name,
    this.product_detail__new_price,
    this.product_detail_old_price,
    this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        centerTitle: true,
        //to make the title text appear in the center
        backgroundColor: Colors.red,
        title: Text('Youcart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white,), onPressed: () {}),
          //for search bar icon
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,),
              onPressed: () {}),
          //for cart icon
        ],
      ),
      body: new ListView(
        children: <Widget>[
      new Container(
      height: 300.0,
        child: GridTile(
            child: Container(
              color: Colors.white,
              child: Image.asset(widget.product_detail_picture),
            ),
            footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name, style: TextStyle(fontWeight
                      : FontWeight.bold, fontSize: 16.0),),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("\$${widget.product_detail_old_price}",
                          style: TextStyle(color: Colors.grey,
                              decoration: TextDecoration.lineThrough),),
                      ),
                      Expanded(
                        child: new Text("\$${widget.product_detail__new_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),),
                      ),
                    ],
                  ),
                )
            )
        ),
      ),
      //==========================FIRST BUTTONS=======================
      Row(
          children: <Widget>[
      //==============THE SIZE BUTTON==========================
      Expanded(
          child: MaterialButton(
            onPressed: (){
              showDialog(context: context,
                  builder: (context){
                return new AlertDialog(                     //alert box to select the size
                    title: new Text("Size"),
                  content: new Text("choose the size"),
                  actions: <Widget>[
                    new MaterialButton(onPressed: (){
                      Navigator.of(context).pop(context);
                    },
                    child: new Text("close"),
                      textColor: Colors.lightBlue,             //set the color of close to blue
                    )
                  ],
                );
              });
            },
      color: Colors.white,
      textColor: Colors.grey,
      elevation: 0.2,
      child: Row(
        children: <Widget>[
          Expanded(
              child: new Text("Size")
          ),
          Expanded(
              child: new Icon(Icons.arrow_drop_down)
          ),
        ],
      ),)),
            //==============THE COLOR BUTTON==========================
            Expanded(
                child: MaterialButton(onPressed: ()
                {
                  showDialog(context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("color"),
                          content: new Text("choose the color"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("close"),
                              textColor: Colors.lightBlue,
                            )
                          ],
                        );
                      });
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Color")
                      ),
                      Expanded(
                          child: new Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),)),
            //==============THE QUANTITY BUTTON==========================
            Expanded(
                child: MaterialButton(
                  onPressed: ()
                {
                  showDialog(context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("quantity"),
                          content: new Text("choose the quantity"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("close"),
                              textColor: Colors.lightBlue,
                            )
                          ],
                        );
                      });
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Qty")
                      ),
                      Expanded(
                          child: new Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),)),
    ],
    ),
        //  ======================THE SECOND BUTTON====================
          Row(
            children: <Widget>[
              //==============THE Buy now BUTTON==========================
              Expanded(
                  child: MaterialButton(
                    onPressed: ()
                  {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy now")
                  ),
              ),
              //==============THE CART BUTTON==========================

              new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.red, onPressed: (){}),
              //==============THE FAVORITE BUTTON==========================

              new IconButton(icon: Icon(Icons.favorite_border),color: Colors.red, onPressed: (){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum\."),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("product name",style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("product Brand",style: TextStyle(color: Colors.grey),),),
              //TODO REMEMBER TO CREATE A PRODUCT BRAND
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),)
            ],
          ),
          //TODO ADD the product condition
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("product Condition",style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("New"),)
            ],
          ),
    ],

    ),
    );
  }
}
