import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';

import 'commonheader/common_header.dart';

class CheckList extends StatelessWidget {
  const CheckList({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Check List", "View"),
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
                'Check List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ...provider.talaipalliFormsList
                .map(
                  (e) => Card(
                    child: ListTile(
                      onTap: () {
                        if (e['id'] == 1) {
                          provider.getCheckList(context);
                        } else if (e['id'] == 2) {
                          provider.getDozerMaintainaceWeekData(context);
                        } else if (e['id'] == 3) {
                          // drill_maintainace_daily
                          provider.getDrillMaintainaceDailyData(context);
                        } else if (e['id'] == 4) {
                          provider.getdrillMaintainaceWeeklyData(context);
                        } else if (e['id'] == 5) {
                          provider.getexcavatorMaintainaceDailyData(context);
                        } else if (e['id'] == 6) {
                          provider.getExplosiveVanMaintainaceDailyData(context);
                        } else if (e['id'] == 7) {
                          provider
                              .getExplosiveVanMaintainaceweeklyData(context);
                        } else if (e['id'] == 9) {
                          provider.getshowMstGraderMaintainaceweeklyData(
                              context,
                              "Grader Maintainace Weekly",
                              "show_mst_grader_maintainace_weekly",
                              9);
                        } else if (e['id'] == 10) {
                          provider.getshowMstGraderMaintainaceweeklyData(
                              context,
                              "SM Maintainace Daily",
                              "show_mst_sm_maintainace_daily",
                              10);
                        } else if (e['id'] == 11) {
                          provider.getshowMstGraderMaintainaceweeklyData(
                              context,
                              "SM Maintainace Weekly",
                              "show_mst_sm_maintainace_weekly",
                              11);
                        } else if (e['id'] == 12) {
                          provider.getshowMstGraderMaintainaceweeklyData(
                              context,
                              "Tanker Maintainace Weekly",
                              "show_mst_tanker_maintainace_weekly",
                              12);
                        } else if (e['id'] == 13) {
                          provider.getshowMstGraderMaintainaceweeklyData(
                              context,
                              "Tipper Maintainace Daily",
                              "show_mst_tipper_maintainace_daily",
                              13);
                        } else if (e['id'] == 14) {
                          provider.getshowMstGraderMaintainaceweeklyData(
                              context,
                              "Tipper Maintainace Weekly1",
                              "show_mst_tipper_maintainace_weekly",
                              14);
                        } else if (e['id'] == 15) {
                          provider.getshowMstGraderMaintainaceweeklyData(
                              context,
                              "Tipper Maintainace Weekly2",
                              "show_mst_tipper_maintainace_weekly2",
                              15);
                        } else if (e['id'] == 17) {
                          provider
                              .getprestartcheckinEveryshiftinLineData(context);
                        } else if (e['id'] == 16) {
                          provider.getDailyInspectionChecklistData(context);
                        } else if (e['id'] == 18) {
                          provider.getdailychecksheetData(context);
                        } else if (e['id'] == 19) {
                          provider.getdailypreshiftchecksheetData(context);
                        } else if (e['id'] == 20) {
                          provider.getoperatorsafetychecklistData(context);
                        } else if (e['id'] == 21) {
                          provider.getshovelprestartchecklistData(context);
                        } else if (e['id'] == 22) {
                          provider.getdailymaintenacechecklistData(context);
                        } else if (e['id'] == 23) {
                          provider.getexcavatordailychecklistData(context);
                        } else if (e['id'] == 24) {
                          Navigator.pushNamed(context, '/Cmhq');
                        } else if (e['id'] == 25) {
                          provider.getCmhqview(context);
                        } else if (e['id'] == '26') {
                          Navigator.pushNamed(context, '/getCmhqupdate');
                        } else if (e['id'] == 27) {
                          Navigator.pushNamed(context, '/rakloding');


                        } else if (e['id'] == '29') {
                          Navigator.pushNamed(context, '/getrakeview');

                        } else if (e['id'] == '30') {
                          Navigator.pushNamed(context, '/getraklodingupdate');


                        } else if (e['id'] == 28) {
                          Navigator.pushNamed(context, '/Hemmsytemfrom');
                        } else if (e['id'] == '31') {
                          Navigator.pushNamed(context, '/getHemmsytemfromview');

                        } else if (e['id'] == '33') {
                          Navigator.pushNamed(context, '/getHemmsystemeditandupdate');
                        }

                        //
                        //
                        //  else if (e['id'] == 16) {
                        //   provider.getshowMstGraderMaintainaceweeklyData(
                        //       context,
                        //       "Inspection Checklist",
                        //       "show_daily_inspection_checklist",
                        //       16);
                        // } else if (e['id'] == 17) {
                        //   provider.getshowMstGraderMaintainaceweeklyData(
                        //       context,
                        //       "",
                        //       "show_pre_start_check_in_every_shift_in_line",
                        //       17);
                        // } else if (e['id'] == 18) {
                        //   provider.getshowMstGraderMaintainaceweeklyData(
                        //       context, "", "show_daily_check_sheet", 18);
                        // } else if (e['id'] == 19) {
                        //   provider.getshowMstGraderMaintainaceweeklyData(
                        //       context,
                        //       "",
                        //       "show_daily_pre_shiftcheck_sheet",
                        //       19);
                        // } else if (e['id'] == 20) {
                        //   provider.getshowMstGraderMaintainaceweeklyData(
                        //       context,
                        //       "",
                        //       "show_Operator_Safety_Checklist",
                        //       20);
                        // } else if (e['id'] == 21) {
                        //   provider.getshowMstGraderMaintainaceweeklyData(
                        //       context,
                        //       "",
                        //       "show_shovel_pre_start_checklist",
                        //       21);
                        // } else if (e['id'] == 22) {
                        //   provider.getshowMstGraderMaintainaceweeklyData(
                        //       context,
                        //       "",
                        //       "show_daily_maintenance_check_list",
                        //       22);
                        // } else if (e['id'] == 23) {
                        //   provider.getshowMstGraderMaintainaceweeklyData(
                        //       context,
                        //       "",
                        //       "show_excavator_daily_checklist",
                        //       23);
                        // } else if (e['id'] == 24) {
                        //   Navigator.pushNamed(context, '/Cmhq');
                        // } else if (e['id'] == 25) {
                        //   provider.getCmhqview(context);
                        // } else if (e['id'] == '26') {
                        //   Navigator.pushNamed(context, '/getCmhqupdate');
                        // } else {
                        //   print("Else part ${e['id']}");
                        // }
                      },
                      leading: Text(
                          " ${provider.talaipalliFormsList.indexOf(e) + 1}  ${e['title']}"),
                      trailing: Icon(
                        Icons.arrow_forward,
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
