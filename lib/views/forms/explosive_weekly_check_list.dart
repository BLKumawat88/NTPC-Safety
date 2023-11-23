import 'package:flutter/material.dart';
import 'package:ntpc/model/maintenance_weekly_checklist_explosive_van/weekly_explosive_van_model.dart';
import 'package:ntpc/theme/common_theme.dart';

import '../commonheader/common_header.dart';

class ExplosiveWeeklyCheckList extends StatefulWidget {
  const ExplosiveWeeklyCheckList({super.key});

  @override
  State<ExplosiveWeeklyCheckList> createState() =>
      _ExplosiveWeeklyCheckListState();
}

class _ExplosiveWeeklyCheckListState extends State<ExplosiveWeeklyCheckList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader("सचेतन", context,
          "MAINTENANCE WEEKLY CHECK LIST : EXPLOSIVE VAN", "View"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text(
              'NTPC LTD. TALAIPALLI COAL MINING PROJECT, SOUTH-PIT (MDO: S.S. CHHATWAL AND COMPANY PVT. LTD.) '
              'MAINTENANCE WEEKLY CHECK LIST : EXPLOSIVE VAN',
              style: CommonTheme.headingOne,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF128CC1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EQPT. MODEL:',
                          style: CommonTheme.headingOne,
                        ),
                        Row(
                          children: [
                            Expanded(child: TextFormField()),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: TextFormField()),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: TextFormField()),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: TextFormField()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ...weeklyExplosiveVan.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sl. No.',
                                      style: CommonTheme.headingOne,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(e.serialNumber),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Check point',
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          e.checkPoint,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Action Required',
                                      style: CommonTheme.headingOne,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionRequired,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionRequired = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.cgName,
                                    style: CommonTheme.headingOne,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.rectified,
                                    style: CommonTheme.headingOne,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.criticalParts,
                                    style: CommonTheme.headingOne,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF128CC1),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Remarks:',
                            style: CommonTheme.headingOne,
                          ),
                        ),
                        Expanded(child: TextFormField()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
              ),
              onPressed: () {},
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
