import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../theme/common_theme.dart';
import '../viewpdf/downlaod_pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewExample extends StatefulWidget {
  final String urlOfPDF;
  const WebViewExample({super.key, required this.urlOfPDF});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController controller;
  @override
  void initState() {
    print('https://docs.google.com/viewer?url=${widget.urlOfPDF}');
    // TODO: implement initState AIzaSyAw4qqJJkmB9NTnfn7srcNLNOg-RdaIoNE
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          // 'https://docs.google.com/viewer?url=${widget.urlOfPDF}',
          'https://docs.google.com/gview?key=AIzaSyAw4qqJJkmB9NTnfn7srcNLNOg-RdaIoNE&embedded=true&url=${widget.urlOfPDF}',
        ),
      );
  }

  void commonMethodForNTPCSafetyOpenPDF(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(urlTwitter,
          mode: LaunchMode.externalNonBrowserApplication);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CommonTheme.headerCommonColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png.png',
                width: 50,
              ),
              Expanded(
                child: Text(
                  "सचेतन",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
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
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                commonMethodForNTPCSafetyOpenPDF(widget.urlOfPDF);
                // DownloadFiles.downloadImageAndPDF(pdfUrl);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DownloadingDialog(
                //         urlOfPdf: widget.urlOfPDF, pdfNameURl: widget.urlOfPDF),
                //   ),
                // );
              },
              icon: Icon(
                Icons.download,
              ),
            ),
          ],
        ),
        body: Container(
          child: WebViewWidget(
            controller: controller,
          ),
        )
        //   SfPdfViewer.network('${widget.urlOfPDF}',
        //       canShowScrollHead: false, canShowScrollStatus: false),
        // )

        // WebView(
        //   initialUrl: 'https://docs.google.com/viewer?url=${widget.urlOfPDF}',
        //   javascriptMode: JavascriptMode.unrestricted,
        // ),
        );
  }
}
