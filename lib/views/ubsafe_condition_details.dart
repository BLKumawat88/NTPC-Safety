import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/all_in_provider.dart';

class UnsafeConditionDetailsPage extends StatelessWidget {
  final data;
  const UnsafeConditionDetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of<AllInProvider>(context, listen: false);
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
            Text('सचेतन'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                final Uri urlTwitter = Uri.parse(
                    "${provider.imageDownloadLink}${data['incident_image']}");

                await launchUrl(urlTwitter,
                    mode: LaunchMode.externalNonBrowserApplication);
              } catch (e) {}

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DownloadingDialog(
              //         urlOfPdf:
              //             "${provider.imageDownloadLink}${data['incident_image']}",
              //         pdfNameURl: "${data['incident_image']}"),
              //   ),
              // );
            },
            icon: Icon(
              Icons.download,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Image.network(
                  "${provider.imageDownloadLink}${data['incident_image']}",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Incident Subject : ${data['incident_subject']}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Discription : ${data['incident_discription']}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
