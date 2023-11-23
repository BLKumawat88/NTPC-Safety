import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../commonheader/common_header.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Notifications", "View"),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ...provider.notificationListForDozerDaily
              .map((e) => Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${e['title']}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ...e['data']
                                .map((e1) => Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Plant Name : ${e1['plant_name']}",
                                            ),
                                            Text(
                                              "Name : ${e1['name']}",
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Vehicle Id : ${e1['vehicle_id']}",
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Title : ${e1['title']}",
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Line Item Name : ${e1['LineItem_Name']}",
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Remarks : ${e1['remarks']}",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList()
                          ],
                        ),
                      )),
                    ),
                  ))
              .toList()
        ]),
      ),
    );
  }
}
