import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'downlaod_pdf.dart';
import 'package:url_launcher/url_launcher.dart';

class PDFViewerScreen extends StatelessWidget {
  final String pdfUrl;
  final String pdfName;
  PDFViewerScreen({super.key, required this.pdfUrl, required this.pdfName});
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  void commonMethodForNTPCSafetyOpenPDF(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(urlTwitter,
          mode: LaunchMode.externalNonBrowserApplication);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    print(pdfUrl);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png.png',
                    width: 50,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Image.asset(
                      'assets/images/kavach.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text('सचेतन'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              commonMethodForNTPCSafetyOpenPDF(pdfUrl);
              // DownloadFiles.downloadImageAndPDF(pdfUrl);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         DownloadingDialog(urlOfPdf: pdfUrl, pdfNameURl: pdfName),
              //   ),
              // );
            },
            icon: Icon(
              Icons.download,
            ),
          )
        ],
      ),
      body: SfPdfViewer.network(
        pdfUrl,
        key: _pdfViewerKey,
      ),
    );
  }
}
