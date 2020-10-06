import 'package:abc/FAB.dart';
import 'package:abc/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'images.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // Main PDF Object ;
  final pdf = PDF();

  Widget build(BuildContext ctx) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("APDF"),
          ),
          body: MyImagesView(pdf),
          floatingActionButton: FAB(pdf)));
}
