import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../commonheader/common_header.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  void commonMethodForNTPCSafetyOpenPDF(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(
        urlTwitter,
        mode: LaunchMode.inAppWebView,
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    // AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Health", "View"),
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
                'Health',
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
                  onTap: () {},
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
                        "IME",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                        "Bar PME Data",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Ambient airquality",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "First Aid Statistics",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {},
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
                          "Ambulance Details",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
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
