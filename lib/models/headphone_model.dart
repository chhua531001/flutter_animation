import 'dart:ui';

class Product {
  final Color color;
  final String image;

  Product({required this.color, required this.image});
}

List<Product> products = [
  Product(
    color: const Color(0xff000000),
    image: 'images/image1.png',
  ),
  Product(
    color: const Color(0xfffcecd0),
    image: 'images/image2.png',
  ),
  Product(
    color: const Color(0xffb6d7e4),
    image: 'images/image3.png',
  ),
];
