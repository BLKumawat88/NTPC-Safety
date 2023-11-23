import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/common_theme.dart';
import '../commonheader/common_header.dart';

class MyHazardsScreen extends StatefulWidget {
  MyHazardsScreen({super.key});

  @override
  State<MyHazardsScreen> createState() => _MyHazardsScreenState();
}

class _MyHazardsScreenState extends State<MyHazardsScreen> {
  final List remarkStatus = [
    {"name": "Done", "id": 1},
    {"name": "Pending", "id": 2},
    {"name": "Attended", "id": 3},
    {"name": "Not done", "id": 4},
    {"name": "On Progress", "id": 5},
  ];

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "eSMP Work plan actions pending with me", "View"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: Text(
                'Work plan actions pending with me',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ...provider.myHazardsData
                .map(
                  (e) => InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: CommonTheme.headerCommonColor,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  "${provider.myHazardsData.indexOf(e) + 1}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Work plan number: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                    child: Text(
                                  e['work_plan_number'].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Subject: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                    child: Text(
                                  e['subject'].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Mechanism: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: Text(
                                    e['mechanism'].toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Control: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: Text(
                                    e['control'].toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Procedure: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: Text(
                                    e['procedure'].toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.teal,
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        margin: EdgeInsets.only(top: 10),
                                        child: DropdownButton<String>(
                                          underline: SizedBox(),
                                          value: '',
                                          isExpanded: true,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.black,
                                          ),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text(
                                                'Work Status',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              value: '',
                                            ),
                                            ...remarkStatus
                                                .map<DropdownMenuItem<String>>(
                                                    (dropDownData) {
                                              return DropdownMenuItem(
                                                child: Text(
                                                  dropDownData['name'],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                value: dropDownData['name']
                                                    .toString(),
                                              );
                                            }).toList(),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              e['work_status'] = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          e['work_status'],
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              initialValue: e['work_plan_feedback'].toString(),
                              onChanged: (value) {
                                e['work_plan_feedback'] = value;
                              },
                              decoration: InputDecoration(
                                labelText: "Remarks:",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Map requestData = {
                                    'id': e['id'],
                                    'work_plan_feedback':
                                        e['work_plan_feedback'],
                                    'work_status': e['work_status']
                                  };

                                  if (e['work_status'] != "") {
                                    provider.submitPendingWork(
                                        context, requestData);
                                  } else {}
                                },
                                child: Text("Submit"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
