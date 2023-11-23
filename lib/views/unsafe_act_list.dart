import 'package:flutter/material.dart';
import 'package:ntpc/views/ubsafe_condition_details.dart';
import 'package:provider/provider.dart';
import '../controller/all_in_provider.dart';
import '../theme/common_theme.dart';
import 'commonheader/common_header.dart';

class UnsafeActListScreen extends StatelessWidget {
  const UnsafeActListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of<AllInProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.getUnsafe_act_list_data(context);
    });

    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Unsafe Condition", "View"),
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
                'Unsafe Condition',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: Text(
                  "${provider.requiredDataToGetUnsafe_act_list['plant_name'].toString().replaceAll('\n', "")}>${provider.requiredDataToGetUnsafe_act_list['location_name']}"),
            ),
            SizedBox(
              height: 20,
            ),
            provider.flagValue
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                CommonTheme.buttonBackgrooundCommonColor),
                        onPressed: () {
                          Navigator.pushNamed(context, '/upload_screen');
                        },
                        child: Text("Create Incident"),
                      ),
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
            Consumer<AllInProvider>(
              builder: (context, value, child) => provider
                      .getUnsafe_act_list.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 6),
                      child: Center(
                        child:
                            Text('There is no form available at this moment'),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(0)),
                      child: DataTable(
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
                              child: Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Incident Report Title',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
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
                          ...provider.getUnsafe_act_list.map(
                            (e) {
                              return DataRow(
                                cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      '${provider.getUnsafe_act_list.indexOf(e) + 1}',
                                      style: TextStyle(
                                        color: Color(0xFF767676),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      e['incident_subject'],
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
                                          // String url =
                                          //     "${provider.imageDownloadLink}${e['incident_image']}";

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UnsafeConditionDetailsPage(
                                                      data: e),
                                            ),
                                          );
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => DownloadingDialog(
                                          //         urlOfPdf: url,
                                          //         pdfNameURl: provider.iconsPath),
                                          //   ),
                                          // );
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
            ),
          ],
        ),
      ),
    );
  }
}
