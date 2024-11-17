import 'package:first_project/W6-S1/EXERCISE-4/joke_data.dart';
import 'package:first_project/W6-S1/EXERCISE-4/joke_model.dart';
import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JokesApp(),
    ));

class JokesApp extends StatefulWidget {
  @override
  _JokesAppState createState() => _JokesAppState();
}

class _JokesAppState extends State<JokesApp> {
  int? favoriteIndex;

  void setFavorite(int index) {
    setState(() {
      if (favoriteIndex == index) {
        favoriteIndex = null;
        jokes[index].isFavorite = false;
      } else {
        if (favoriteIndex != null) jokes[favoriteIndex!].isFavorite = false;
        favoriteIndex = index;
        jokes[index].isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            joke: jokes[index],
            isFavorite: jokes[index].isFavorite,
            onFavoriteClick: () => setFavorite(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
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
