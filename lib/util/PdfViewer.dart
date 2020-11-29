import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mini_med_front/controller/HistoryController.dart';

class PdfViewer extends StatefulWidget {
  @override
  PdfViewerState createState() => PdfViewerState();
}

class PdfViewerState extends State<PdfViewer> {
  String localPath;

  @override
  void initState() {
    HistoryController controller = HistoryController();
    controller.findPdfById(1).then((value) {
      setState(() {
        localPath = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: localPath != null
          ? PDFView(
        filePath: localPath,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }

}
