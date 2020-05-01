import 'package:flutter/material.dart';
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/cats/tshirt.png',
            image_caption: 'shirt',
          ),
          Category(
            image_location: 'assets/images/cats/shoe.png',
            image_caption: 'shirt',
          ),
          Category(
            image_location: 'assets/images/cats/jeans.png',
            image_caption: 'shirt',
          ),
          Category(
            image_location: 'assets/images/cats/informal.png',
            image_caption: 'shirt',
          ),
          Category(
            image_location: 'assets/images/cats/formal.png',
            image_caption: 'shirt',
          ),
          Category(
            image_location: 'assets/images/cats/dress.png',
            image_caption: 'shirt',
          ),
        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(
      onTap: (){},
      child: Container(
        width: 120.0,
        child: ListTile(
          title: Image.asset(
              image_location,
                width: 150.0,   // width of the container
                height: 60.0,   // height of the container
          ),
          subtitle: Text(
              image_caption,
              textAlign: TextAlign.center,
          ),
        ),
      ),
    ),);
  }
}

