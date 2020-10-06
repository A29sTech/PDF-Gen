import 'package:abc/pdf.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MyImagesView extends StatefulWidget {
  // Get Pdf As Paramiter ;
  final PDF pdf;
  MyImagesView(this.pdf);

  @override
  State<StatefulWidget> createState() => MyImagesState();
}

class MyImagesState extends State<MyImagesView> {
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    widget.pdf.addEventLitchner(update);
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      StatefulBuilder(builder: (BuildContext ctx, _) {
        return ListView(
          children: [
            Center(
              child: Text("Clear, Add Pages and Save"),
            ),
            ...widget.pdf.imgPathList.map((e) {
              return Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: Offset(2.0, 2.0),
                      spreadRadius: 5.0,
                      blurRadius: 10.0)
                ]),
                margin: EdgeInsets.all(10.0),
                child: Image.file(File(e)),
              );
            }).toList()
          ],
        );
      });
}
