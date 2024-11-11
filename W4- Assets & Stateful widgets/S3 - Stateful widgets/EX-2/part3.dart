import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [
            FavoriteCard(),
            FavoriteCard(),
            FavoriteCard(),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: const BoxDecoration(
               border: Border(
                  bottom: BorderSide(width: .5, color: Colors.grey),
                ),
              ),
                child: Row(
                  children: [
                    const Expanded(child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('title', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w800)),
                        SizedBox(height: 10.0),
                        Text('description', style: TextStyle(color: Colors.grey)),
                      ],
                    )
                    ),
                    IconButton(
                      onPressed: toggleFavorite,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
            );
  }
}
