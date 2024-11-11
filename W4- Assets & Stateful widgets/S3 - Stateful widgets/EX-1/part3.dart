import 'package:first_project/W4-S3/EX-1/part2.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Buttons"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableButton(),
              const SizedBox(height: 20), 
              SelectableButton(),
              const SizedBox(height: 20), 
              SelectableButton(),
              const SizedBox(height: 20), 
              SelectableButton(),
            ],
          ),
        ),
      ),
    ));
