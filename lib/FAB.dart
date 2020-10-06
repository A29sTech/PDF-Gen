import 'package:abc/pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FAB extends StatefulWidget {
  // Ref To PDF Obejct;
  final PDF pdf;
  FAB(this.pdf);

  @override
  State<StatefulWidget> createState() => FabState();
}

class FabState extends State<FAB> {
  bool inProgress = false;

  void changeState(bool state) {
    setState(() {
      inProgress = state;
    });
  }

  @override
  Widget build(BuildContext context) => IgnorePointer(
        ignoring: inProgress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: FloatingActionButton(
                backgroundColor: inProgress ? Colors.red : Colors.blueAccent,
                child: IconButton(icon: Icon(Icons.info), onPressed: null),
                onPressed: () async {
                  // Handle Info;
                  showAboutDialog(
                      context: context,
                      applicationName: "Pdf App",
                      applicationLegalese:
                          "This App Is Especially Build For: Zabed, Nasir");
                },
              ),
            ),
            FloatingActionButton(
                backgroundColor: inProgress ? Colors.red : Colors.blueAccent,
                child: IconButton(icon: Icon(Icons.clear), onPressed: null),
                onPressed: () {
                  // Handle Clear Button;
                  widget.pdf.clear();
                }),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: FloatingActionButton(
                backgroundColor: inProgress ? Colors.red : Colors.blueAccent,
                child: IconButton(icon: Icon(Icons.add), onPressed: null),
                onPressed: () async {
                  // Handle Add Button;
                  changeState(true);
                  await widget.pdf.addImageAsPage();
                  changeState(false);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: FloatingActionButton(
                backgroundColor: inProgress ? Colors.red : Colors.blueAccent,
                child: IconButton(icon: Icon(Icons.save), onPressed: null),
                onPressed: () async {
                  // Handle Save Button;
                  changeState(true);
                  await widget.pdf.save("OutPut.pdf");
                  changeState(false);
                  Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text(
                          "Saved At: Android/Data/com.example.abc/files")));
                },
              ),
            )
          ],
        ),
      );
}
