import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/all_in_provider.dart';
import '../commonheader/common_header.dart';
import '../viewpdf/pdf_viewer.dart';
import '../webview/web_view.dart';

class SafetyListScreen extends StatelessWidget {
  const SafetyListScreen({super.key});

  void commonMethodForNTPCSafetyOpenPDF(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(
        urlTwitter,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "NTPC Safety", "View"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'NTPC Safety',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              children: [
                InkWell(
                  onTap: () {
                    print("gg");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => WebViewExample(
                    //           urlOfPDF:
                    //               "https://coalmining.ntpc.co.in/public/ntpc_safety/SafetyPolicy2018.pdf")),
                    // );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFViewerScreen(
                          pdfUrl:
                              "https://coalmining.ntpc.co.in/public/ntpc_safety/SafetyPolicy2018.pdf",
                          pdfName:
                              "https://coalmining.ntpc.co.in/public/ntpc_safety/SafetyPolicy2018.pdf",
                        ),
                      ),
                    );
                    // commonMethodForNTPCSafetyOpenPDF(
                    //     "https://coalmining.ntpc.co.in/public/ntpc_safety/SafetyPolicy2018.pdf");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8E00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "NTPC Safety Policy",
                        textAlign: TextAlign.center,
                        style: provider.iPadSize
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: provider.textFontSize,
                              )
                            : TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => WebViewExample(
                    //           urlOfPDF:
                    //               "https://coalmining.ntpc.co.in/public/ntpc_safety/SafetyHealth.pdf")),
                    // );
                    // commonMethodForNTPCSafetyOpenPDF(
                    //     "https://coalmining.ntpc.co.in/public/ntpc_safety/SafetyHealth.pdf");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFViewerScreen(
                          pdfUrl:
                              "https://coalmining.ntpc.co.in/public/ntpc_safety/SafetyHealth.pdf",
                          pdfName:
                              "https://coalmining.ntpc.co.in/public/ntpc_safety/SafetyHealth.pdf",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8E00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Safety & Health Framework",
                        textAlign: TextAlign.center,
                        style: provider.iPadSize
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: provider.textFontSize,
                              )
                            : TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => WebViewExample(
                    //           urlOfPDF:
                    //               "https://coalmining.ntpc.co.in/public/ntpc_safety/CompetencyFramework.pdf")),
                    // );

                    // commonMethodForNTPCSafetyOpenPDF(
                    //     "https://coalmining.ntpc.co.in/public/ntpc_safety/CompetencyFramework.pdf");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFViewerScreen(
                          pdfUrl:
                              "https://coalmining.ntpc.co.in/public/ntpc_safety/CompetencyFramework.pdf",
                          pdfName:
                              "https://coalmining.ntpc.co.in/public/ntpc_safety/CompetencyFramework.pdf",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(right: 5),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8E00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Competency Framework",
                        textAlign: TextAlign.center,
                        style: provider.iPadSize
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: provider.textFontSize,
                              )
                            : TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/ntpc_mission');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(right: 5),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8E00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "NTPC Vision & Mission ",
                        textAlign: TextAlign.center,
                        style: provider.iPadSize
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: provider.textFontSize,
                              )
                            : TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
