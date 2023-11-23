import 'package:flutter/material.dart';
import 'package:ntpc/model/excavator_model/attachments_model.dart';
import 'package:ntpc/model/excavator_model/auto_electricals.dart';
import 'package:ntpc/model/excavator_model/dgms_excavator_model.dart';
import 'package:ntpc/model/excavator_model/excavator_static_form_model.dart';
import 'package:ntpc/model/excavator_model/general_model.dart';
import 'package:ntpc/model/excavator_model/greasing_points_model.dart';
import 'package:ntpc/model/excavator_model/hydraulics_model.dart';
import 'package:ntpc/model/excavator_model/prime_mover_post_start.dart';
import 'package:ntpc/model/excavator_model/prime_mover_pre_start.dart';
import 'package:ntpc/model/excavator_model/undercarriage_model.dart';
import 'package:ntpc/model/excavator_model/upper_structure.dart';
import 'package:ntpc/theme/common_theme.dart';

import '../commonheader/common_header.dart';

class ExcavatorForm extends StatefulWidget {
  const ExcavatorForm({super.key});

  @override
  State<ExcavatorForm> createState() => _ExcavatorFormState();
}

class _ExcavatorFormState extends State<ExcavatorForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "MAINTENANCE DALIY CHECK LIST", "View"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text(
              'NTPC LTD. TALAIPALLI COAL MINING PROJECT, SOUTH-PIT (MDO: S.S. CHHATWAL AND COMPANY PVT. LTD.) MAINTENANCE DALIY CHECK LIST',
              style: CommonTheme.headingOne,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '1.0 DGMS Compliance:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...dgmsExcavatorForm.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '2.0 Prime Mover Pre Start:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...primeMoverPreStart.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '3.0 Prime Mover Post Start:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...primeMoverPostStart.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '4.0 Hydraulics:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...hydraulics.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '5.0 	Undercarriage:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...undercarriage.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '6.0 	Attachments:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...attachments.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '7.0 	Upper Structure:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...upperStructure.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '8.0 	Auto Electricals:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...autoElectricals.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '9.0 Greasing Points:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...greasingPoints.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                    ),
                    child: Text(
                      '10.0 General:',
                      style: CommonTheme.headingOne,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...general.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo20,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo21,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo22,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo3,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo3 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.volvo23,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.volvo4,
                                            onChanged: (value) {
                                              setState(() {
                                                e.volvo4 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai390,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai1,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai1 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.hyundai210,
                                        style: CommonTheme.headingOne,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Checkbox(
                                            fillColor:
                                                MaterialStateProperty.all(
                                              Color(0xFF128CC1),
                                            ),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: e.hyundai2,
                                            onChanged: (value) {
                                              setState(() {
                                                e.hyundai2 = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.action,
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.actionTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.actionTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Action taken',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                            Color(0xFF128CC1),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: e.toBeTaken,
                                          onChanged: (value) {
                                            setState(() {
                                              e.toBeTaken = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('To be taken'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Remarks:',
                            style: CommonTheme.headingOne,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: TextFormField(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ...excavatorStaticForm.map(
                    (e) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFF128CC1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Inspected By',
                              style: CommonTheme.headingOne,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(e.title),
                                ),
                                Expanded(
                                  child: TextFormField(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Maintenance Head'),
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
                  ).toList()
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
