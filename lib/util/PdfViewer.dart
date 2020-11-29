import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mini_med_front/controller/HistoryController.dart';

class PdfViewer extends StatefulWidget {
  final int historyId;

  PdfViewer(this.historyId);

  @override
  PdfViewerState createState() => PdfViewerState();
}

class PdfViewerState extends State<PdfViewer> {
  String localPath;

  @override
  void initState() {
    HistoryController controller = HistoryController();
    controller.findPdfById(widget.historyId).then((value) {
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
