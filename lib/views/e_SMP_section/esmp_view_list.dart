import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/views/commonheader/common_header.dart';
import 'package:provider/provider.dart';
import '../../common_theme/common_dialog.dart';
import '../../theme/common_theme.dart';
import 'hazards_sub_hazards_details.dart';

class ESMPViewList extends StatelessWidget {
  ESMPViewList({super.key});
  TextEditingController riskscore = TextEditingController();

  editWorkPlanNumber(context, id, AllInProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Risk Score'),
          content: TextField(
            controller: riskscore,
            decoration: InputDecoration(
              labelText: 'Risk Score',
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
                if (riskscore.text == "") {
                  CommanDialog.showErrorDialog(context,
                      description: "Workplan Number Required");
                  return;
                }
                Map requestData = {'id': id, 'riskscore': riskscore.text};
                print(requestData);
                if (provider.ishazardsOrSubhazards == "hazard") {
                  provider.editListofHazards(context, requestData,
                      "update_risk_score_of_hazard_category");
                } else if (provider.ishazardsOrSubhazards == "subhazard") {
                  provider.editListofHazards(context, requestData,
                      "update_risk_score_of_hazard_sub_category");
                } else if (provider.ishazardsOrSubhazards ==
                    "principlehazard") {
                  provider.editListofHazards(context, requestData,
                      "update_risk_score_of_principle_hazards");
                }
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
        provider.ishazardsOrSubhazards == "hazard"
            ? "Hazards List"
            : provider.ishazardsOrSubhazards == "subhazard"
                ? "Sub Hazards List"
                : "Principle Hazard List",
        context,
        provider.ishazardsOrSubhazards == "hazard"
            ? "eSMP Hazards List"
            : provider.ishazardsOrSubhazards == "subhazard"
                ? "eSMP Sub Hazards List"
                : "eSMP Principle Hazard List",
        "View",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            provider.userRoleId == "4"
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: DataTable(
                      horizontalMargin: 10,
                      columnSpacing: 10,
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
                              provider.ishazardsOrSubhazards == "hazard"
                                  ? "Hazard"
                                  : provider.ishazardsOrSubhazards ==
                                          "subhazard"
                                      ? "Sub Hazard"
                                      : " Principle Hazard ",
                              style: TextStyle(color: Colors.white),
                            ),
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
                      ],
                      rows: <DataRow>[
                        ...provider.eSMPData.map(
                          (e) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(
                                    child: Text(
                                      '${provider.eSMPData.indexOf(e) + 1}',
                                      style: TextStyle(
                                        color: Color(0xFF767676),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    provider.ishazardsOrSubhazards == "hazard"
                                        ? e['hazard_description']
                                        : provider.ishazardsOrSubhazards ==
                                                "subhazard"
                                            ? e['sub_hazard_description']
                                            : e['sub_hazard_description'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xFF767676),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 35),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HazardsAndSubHazardDetails(
                                                    data: e),
                                          ),
                                        );
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
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 35),
                                    child: InkWell(
                                      onTap: () {
                                        riskscore.text =
                                            e['riskscore'].toString();
                                        editWorkPlanNumber(
                                          context,
                                          provider.ishazardsOrSubhazards ==
                                                  "hazard"
                                              ? e['hazardai_id']
                                              : provider.ishazardsOrSubhazards ==
                                                      "subhazard"
                                                  ? e['sub_hardai_id']
                                                  : e['sub_hardai_id'],
                                          provider,
                                        );
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.blue,
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
                : Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(0)),
                    child: DataTable(
                      horizontalMargin: 10,
                      columnSpacing: 10,
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
                              provider.ishazardsOrSubhazards == "hazard"
                                  ? "Hazard"
                                  : provider.ishazardsOrSubhazards ==
                                          "subhazard"
                                      ? "Sub Hazard"
                                      : " Principle Hazard ",
                              style: TextStyle(color: Colors.white),
                            ),
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
                        ...provider.eSMPData.map(
                          (e) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(
                                    child: Text(
                                      '${provider.eSMPData.indexOf(e) + 1}',
                                      style: TextStyle(
                                        color: Color(0xFF767676),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    provider.ishazardsOrSubhazards == "hazard"
                                        ? e['hazard_description']
                                        : provider.ishazardsOrSubhazards ==
                                                "subhazard"
                                            ? e['sub_hazard_description']
                                            : e['sub_hazard_description'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xFF767676),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 35),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HazardsAndSubHazardDetails(
                                                    data: e),
                                          ),
                                        );
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
                  ),
          ],
        ),
      ),
    );
  }
}
