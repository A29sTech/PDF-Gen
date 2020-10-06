import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf/widgets.dart' as pw;

class PDF {
  // vars;
  pw.Document doc = pw.Document();
  List<String> imgPathList = [];
  Function fn = () {};

  // Clear Doc;
  void clear() {
    doc = pw.Document();
    imgPathList = [];
    fn();
  }

  // Add An Image As Page;
  Future<bool> addImageAsPage() async {
    try {
      // Pick A File From Library;
      var pickResult =
          await FilePicker.platform.pickFiles(type: FileType.image);
      // Return If File Not Picked;
      if (pickResult == null) return false;
      // Create A File Object From Picked Path;
      File file = File(pickResult.files.single.path);

      // Convert FileType To PdfImage ;
      final img = PdfImage.file(doc.document, bytes: file.readAsBytesSync());

      // Finally Add Page ;
      doc.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context ctx) => pw.FullPage(
              ignoreMargins: true, child: pw.FittedBox(child: pw.Image(img)))));
      imgPathList.add(pickResult.files.single.path);
      // Call CallBack Function ;
      fn();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> save(String filename) async {
    // Get Path Via PathProvider;
    Directory dir = await getExternalStorageDirectory();
    String _path = dir.path;

    File file = File('$_path/$filename');
    file.writeAsBytesSync(doc.save());
    print(_path);
  }

  void addEventLitchner(Function fn) {
    this.fn = fn;
  }
}
