import 'package:flutter/material.dart';
import 'package:ntpc/common_theme/common_dialog.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/common_theme.dart';
import '../commonheader/common_header.dart';

class Listofhazardcontrolpansview extends StatelessWidget {
  Listofhazardcontrolpansview({super.key});

  TextEditingController workPlanNumber = TextEditingController();

  editWorkPlanNumber(context, id, AllInProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Work plan Number'),
          content: TextField(
            controller: workPlanNumber,
            decoration: InputDecoration(
              labelText: 'Work plan Number',
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (workPlanNumber.text == "") {
                  CommanDialog.showErrorDialog(context,
                      description: "Workplan Number Required");
                  return;
                }
                Map requestData = {
                  'id': id,
                  'work_plan_number': workPlanNumber.text
                };
                print(requestData);
                provider.editWorkPlan(context, requestData);
              },
            ),
          ],
        );
      },
    );
  }

  deleteWorkPlan(context, id, AllInProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure to delete?'),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                Map requestData = {'id': id};
                print("$requestData");
                provider.deleteWorkPlan(context, requestData);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Cmhq List", "View"),
      body: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/add_new_esmp_hazard");
                },
                child: Text("Addition of Hazards"),
              ),
            ),
            provider.userRoleId == "4"
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: DataTable(
                      horizontalMargin: 6,
                      columnSpacing: 14,
                      border: TableBorder.all(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(0)),
                      dataRowHeight: 40,
                      headingRowColor: MaterialStateProperty.all(
                        CommonTheme.buttonBackgrooundCommonColor,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(
                            'S.No.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            child: Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                " Work Plan Number"),
                          ),
                        ),
                        DataColumn(
                          label: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 35),
                            child: Text(
                              "View",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 35),
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 35),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        ...provider.hazadrdview.map(
                          (e) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(
                                    child: Text(
                                      '${provider.hazadrdview.indexOf(e) + 1}',
                                      style: TextStyle(
                                        color: Color(0xFF767676),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.remove_red_eye),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${e['work_plan_number']}",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //viewesmpcontrolpans
                                  onTap: () {
                                    provider.getResponsibility(
                                      context,
                                    );
                                    provider.getviewesmpcontrolpans(
                                        context, e['id']);
                                    provider.Id = e['id'].toString();
                                    provider.Id = e['id'].toString();
                                  },
                                ),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 35),
                                    child: InkWell(
                                      onTap: () {
                                        print(e);
                                        provider.getWorkpanbyid(
                                            context, e['id']);
                                        provider.Id = e['id'].toString();
                                      },
                                      child: Icon(
                                        Icons.open_in_new_rounded,
                                        color: CommonTheme
                                            .buttonBackgrooundCommonColor,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  InkWell(
                                    onTap: () {
                                      workPlanNumber.text =
                                          e['work_plan_number'];
                                      editWorkPlanNumber(
                                          context, e['id'], provider);
                                    },
                                    child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 35),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        )),
                                  ),
                                ),
                                DataCell(
                                  InkWell(
                                    onTap: () {
                                      deleteWorkPlan(
                                          context, e['id'], provider);
                                    },
                                    child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 35),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList()
                      ],
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: DataTable(
                      horizontalMargin: 6,
                      columnSpacing: 14,
                      border: TableBorder.all(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(0)),
                      dataRowHeight: 40,
                      headingRowColor: MaterialStateProperty.all(
                        CommonTheme.buttonBackgrooundCommonColor,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(
                            'S.No.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            child: Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                " Work Plan Number"),
                          ),
                        ),
                        DataColumn(
                          label: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 35),
                            child: Text(
                              "View",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        ...provider.hazadrdview.map(
                          (e) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(
                                    child: Text(
                                      '${provider.hazadrdview.indexOf(e) + 1}',
                                      style: TextStyle(
                                        color: Color(0xFF767676),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.remove_red_eye),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${e['work_plan_number']}",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //viewesmpcontrolpans
                                  onTap: () {
                                    provider.getResponsibility(
                                      context,
                                    );
                                    provider.getviewesmpcontrolpans(
                                        context, e['id']);
                                    provider.Id = e['id'].toString();
                                    provider.Id = e['id'].toString();
                                  },
                                ),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 35),
                                    child: InkWell(
                                      onTap: () {
                                        print(e);
                                        provider.getWorkpanbyid(
                                            context, e['id']);
                                        provider.Id = e['id'].toString();
                                      },
                                      child: Icon(
                                        Icons.open_in_new_rounded,
                                        color: CommonTheme
                                            .buttonBackgrooundCommonColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList()
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
