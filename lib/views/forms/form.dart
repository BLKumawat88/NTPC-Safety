import 'package:flutter/material.dart';
import 'package:ntpc/model/daily_eqpt_maintenance_check_list/engine_compartment_model.dart';
import 'package:ntpc/model/daily_eqpt_maintenance_check_list/form_ground_model.dart';
import 'package:ntpc/model/daily_eqpt_maintenance_check_list/insidecab_model.dart';
import 'package:ntpc/model/daily_eqpt_maintenance_check_list/machine_outside_model.dart';
import 'package:ntpc/model/daily_eqpt_maintenance_check_list/static_form_model.dart';
import 'package:ntpc/theme/common_theme.dart';

import '../commonheader/common_header.dart';

class FormMaintenance extends StatefulWidget {
  const FormMaintenance({super.key});

  @override
  State<FormMaintenance> createState() => _FormMaintenanceState();
}

class _FormMaintenanceState extends State<FormMaintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "DAILY EQPT. MAINTENANCE CHECK LIST", "View"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text(
              'NTPC LTD. TALAIPALLI COAL MINING PROJECT, SOUTH-PIT (MDO: S.S. CHHATWAL AND COMPANY PVT. LTD.) DAILY EQPT. MAINTENANCE CHECK LIST',
              style: CommonTheme.headingOne,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '1.0 FROM GROUND:',
                        style: CommonTheme.headingTitle,
                      ),
                    ),
                    ...formMaintenance.map((e) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sr. No.',
                                    style: CommonTheme.headingOne,
                                  ),
                                  Text(
                                    'What are you inspecting?',
                                    style: CommonTheme.headingOne,
                                  ),
                                  Text(
                                    'Ok/Not ok',
                                    style: CommonTheme.headingOne,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.sNo),
                                    Flexible(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        e.headingOne,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
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
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Ok'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
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
                                                  value: false,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                ),
                                                child: Text('Not Ok'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('       '),
                                    Text(
                                      'What are you looking for?',
                                      style: CommonTheme.headingOne,
                                    ),
                                    Text(
                                      'Ok/Not ok',
                                      style: CommonTheme.headingOne,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('    '),
                                    Flexible(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        e.headingTwo,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
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
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Ok'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
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
                                                  value: false,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                ),
                                                child: Text('Not Ok'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                              ),
                              child: Text(
                                'Evaluator comments',
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 8,
                              ),
                              child: TextFormField(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '2.0 ENGINE COMPARTMENT:',
                        style: CommonTheme.headingTitle,
                      ),
                    ),
                    ...engineCompartment.map((e) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sr. No.',
                                    style: CommonTheme.headingOne,
                                  ),
                                  Text(
                                    'What are you inspecting?',
                                    style: CommonTheme.headingOne,
                                  ),
                                  Text(
                                    'Ok/Not ok',
                                    style: CommonTheme.headingOne,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.sNo),
                                    Flexible(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        e.headingOne,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
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
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Ok'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
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
                                                  value: false,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                ),
                                                child: Text('Not Ok'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('       '),
                                    Text(
                                      'What are you looking for?',
                                      style: CommonTheme.headingOne,
                                    ),
                                    Text(
                                      'Ok/Not ok',
                                      style: CommonTheme.headingOne,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('    '),
                                    Flexible(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        e.headingTwo,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
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
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Ok'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
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
                                                  value: false,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                ),
                                                child: Text('Not Ok'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                              ),
                              child: Text(
                                'Evaluator comments',
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 8,
                              ),
                              child: TextFormField(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '3.0 THE MACHINE, OUTSIDE THE:',
                        style: CommonTheme.headingTitle,
                      ),
                    ),
                    ...machineOutside.map((e) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sr. No.',
                                    style: CommonTheme.headingOne,
                                  ),
                                  Text(
                                    'What are you inspecting?',
                                    style: CommonTheme.headingOne,
                                  ),
                                  Text(
                                    'Ok/Not ok',
                                    style: CommonTheme.headingOne,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.sNo),
                                    Flexible(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        e.headingOne,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
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
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Ok'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
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
                                                  value: false,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                ),
                                                child: Text('Not Ok'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('       '),
                                    Text(
                                      'What are you looking for?',
                                      style: CommonTheme.headingOne,
                                    ),
                                    Text(
                                      'Ok/Not ok',
                                      style: CommonTheme.headingOne,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('    '),
                                    Flexible(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        e.headingTwo,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
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
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Ok'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
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
                                                  value: false,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                ),
                                                child: Text('Not Ok'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                              ),
                              child: Text(
                                'Evaluator comments',
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 8,
                              ),
                              child: TextFormField(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '4.0 INSIDE THE CAB:',
                        style: CommonTheme.headingTitle,
                      ),
                    ),
                    ...insideCab.map((e) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
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
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sr. No.',
                                    style: CommonTheme.headingOne,
                                  ),
                                  Text(
                                    'What are you inspecting?',
                                    style: CommonTheme.headingOne,
                                  ),
                                  Text(
                                    'Ok/Not ok',
                                    style: CommonTheme.headingOne,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.sNo),
                                    Flexible(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        e.headingOne,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
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
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Ok'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
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
                                                  value: false,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                ),
                                                child: Text('Not Ok'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('       '),
                                    Text(
                                      'What are you looking for?',
                                      style: CommonTheme.headingOne,
                                    ),
                                    Text(
                                      'Ok/Not ok',
                                      style: CommonTheme.headingOne,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('    '),
                                    Flexible(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        e.headingTwo,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
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
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Ok'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
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
                                                  value: false,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                ),
                                                child: Text('Not Ok'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                              ),
                              child: Text(
                                'Evaluator comments',
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 8,
                              ),
                              child: TextFormField(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
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
                    ...staticForm.map((e) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                top: 8,
                              ),
                              child: Text(
                                'Inspected By',
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('${e.title}:'),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: TextFormField(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
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
                                              value: e.okOne,
                                              onChanged: (value) {
                                                setState(() {
                                                  e.okOne = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 4,
                                            ),
                                            child: Text('Ok'),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
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
                                                value: e.notOkOne,
                                                onChanged: (value) {
                                                  setState(() {
                                                    e.notOkOne = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Not Ok'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Operator:',
                                        style: CommonTheme.headingOne,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: TextFormField(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
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
                                              value: e.okTwo,
                                              onChanged: (value) {
                                                setState(() {
                                                  e.okTwo = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 4,
                                            ),
                                            child: Text('Ok'),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            SizedBox(
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
                                                value: e.notOkTwo,
                                                onChanged: (value) {
                                                  setState(() {
                                                    e.notOkTwo = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 4,
                                              ),
                                              child: Text('Not Ok'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 8,
                              ),
                              child: Text(
                                'Maintence Head:',
                                style: CommonTheme.headingOne,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 8,
                              ),
                              child: TextFormField(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
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
