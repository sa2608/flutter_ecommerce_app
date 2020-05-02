import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
//my own imports from components
import 'package:sanikumarsahani/components/horizontal_listview.dart';
import 'package:sanikumarsahani/components/products.dart';


void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  HomePage(),
      )
  );
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/m1.jpeg'),
          AssetImage('assets/images/w3.jpeg'),
          AssetImage('assets/images/w4.jpeg'),
          AssetImage('assets/images/m2.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,   //the size of the dots
        indicatorBgPadding: 4.0,  // horizontal indicator
        showIndicator: true,
        dotBgColor: Colors.transparent,
      ),
    ) ;
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        centerTitle: true,    //to make the title text appear in the center
        backgroundColor: Colors.red,
        title: Text('Youcart'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),   //for search bar icon
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){}),   //for cart icon
        ],
      ),
      drawer: new Drawer(
        child: new ListView(     //multiple widgets
          children: <Widget>[
            //Header par of our drawer
            new UserAccountsDrawerHeader(
                accountName: Text('Sanikumar Sahani'),
                accountEmail: Text('sanikumarsahani@gmailc.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.red,
              ),
            ),
            //body of the app--------------------------------------------------
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: Colors.red,),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About '),
                leading: Icon(Icons.help, color: Colors.green,),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //Image carousel begins here on top
          image_carousel,
          //Padding Widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categories'),
          ),
          //Horizonatal list view starts here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Recent Products'),
          ),
          //grid view
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}