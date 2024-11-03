import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Our Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: const [
            ProductCard(product: Product.dart),
            ProductCard(product: Product.flutter),
            ProductCard(product: Product.firebase),
          ],
        ),
       ),
     ),
    )
  );
}
enum Product {
  dart(title: 'Dart', description: 'the best object language', imagePath: 'assets/w4-ex2 image/dart.png'),
  flutter(title: 'Flutter', description: 'the best mobile widget library', imagePath: 'assets/w4-ex2 image/flutter.png'),
  firebase(title: 'Firesbase', description: 'the best cloud database', imagePath: 'assets/w4-ex2 image/firebase.png');

  final String title;
  final String description;
  final String imagePath;

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                product.imagePath,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}