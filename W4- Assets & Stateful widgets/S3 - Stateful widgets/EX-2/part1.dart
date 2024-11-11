import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            Container(
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
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    )
                  ],
                ),
            )
          ],
        ),
      ),
    ));
