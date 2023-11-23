import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../commonheader/common_header.dart';
import '../webview/web_view.dart';

class SafetyPerformanceStaticsScreen extends StatelessWidget {
  const SafetyPerformanceStaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Safety Performance Statics", "View"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            child: Text(
              'Safety Performance Statistics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                ...provider.dataOfSafetyPerformanceStatics.map(
                  (e) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewExample(
                                urlOfPDF:
                                    "${provider.safetyPerformanceStatisticsBaseUrl}${e['attachement']}"),
                          ),
                        );
                        // _launchUrl(provider.safetyPerformanceStatisticsBaseUrl,
                        //     e['attachement']);
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
                            e['incident_title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
