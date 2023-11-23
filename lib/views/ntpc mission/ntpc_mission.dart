import 'package:flutter/material.dart';
import '../commonheader/common_header.dart';

class NTPCMission extends StatelessWidget {
  const NTPCMission({super.key});

  final String data =
      "Provide reliable power and related solutions in an economical, efficient andenvironment friendly manner, driven by innovation and agility";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "NTPC Mission", "View"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NTPC Mission',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
