import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:provider/provider.dart';

import '../commonheader/common_header.dart';

class ExcavatorMaintainaceDaily extends StatefulWidget {
  const ExcavatorMaintainaceDaily({super.key});
  @override
  State<ExcavatorMaintainaceDaily> createState() =>
      _ExcavatorMaintainaceDailyState();
}

class _ExcavatorMaintainaceDailyState extends State<ExcavatorMaintainaceDaily> {
  String vehicleIdDefaultId = "";
  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Excavator Maintainace Daily", "View"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text(
              'NTPC LTD. TALAIPALLI COAL MINING PROJECT, SOUTH-PIT (MDO: S.S. CHHATWAL AND COMPANY PVT. LTD.) Excavator Maintainace Daily',
              style: CommonTheme.headingOne1,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
          ),
          provider.excavatorMaintainaceDailyDetails.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Equpment:   ",
                              style: CommonTheme.headingOne1,
                            ),
                            Flexible(
                              child: Text(
                                "${provider.excavatorMaintainaceDailyDetails[0]['eqpt']}",
                                style: CommonTheme.headingOne1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Vehicle Id:   ",
                                style: CommonTheme.headingOne1,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<String>(
                                  underline: SizedBox(),
                                  value: vehicleIdDefaultId,
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(
                                        'Select ID',
                                      ),
                                      value: '',
                                    ),
                                    ...provider.dropDownData
                                        .map<DropdownMenuItem<String>>((e) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          e['item'],
                                        ),
                                        value: e['id'],
                                      );
                                    }).toList(),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      vehicleIdDefaultId = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              "Project:  ",
                              style: CommonTheme.headingOne1,
                            ),
                            Text(
                              "${provider.excavatorMaintainaceDailyDetails[0]['project']}",
                              style: CommonTheme.headingOne1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              "Inspection:  ",
                              style: CommonTheme.headingOne1,
                            ),
                            Text(
                              "${provider.excavatorMaintainaceDailyDetails[0]['dz']}",
                              style: CommonTheme.headingOne1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
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
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Component Group',
                                  style: CommonTheme.headingOne1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Consumer<AllInProvider>(
                          builder: ((context, value, child) => Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...provider.excavatorMaintainaceDailyData
                                        .map(
                                          (e) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                color: Color(0xFF128CC1),
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "${provider.excavatorMaintainaceDailyData.indexOf(e) + 1}.  ${e['title']}",
                                                  style: CommonTheme.headingOne,
                                                ),
                                              ),
                                              ...e['data']
                                                  .map(
                                                    (innerData) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${provider.excavatorMaintainaceDailyData.indexOf(e) + 1}.${e['data'].indexOf(innerData) + 1} ${innerData['name']}",
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Condition",
                                                              ),
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Ok",
                                                                    style: CommonTheme
                                                                        .headingOne,
                                                                  ),
                                                                  Radio(
                                                                    value: 1,
                                                                    groupValue:
                                                                        innerData[
                                                                            'condition'],
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                        () {
                                                                          innerData['condition'] =
                                                                              1;
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Not Ok",
                                                                    style: CommonTheme
                                                                        .headingOne,
                                                                  ),
                                                                  Radio(
                                                                    value: 0,
                                                                    groupValue:
                                                                        innerData[
                                                                            'condition'],
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        innerData[
                                                                            'condition'] = 0;
                                                                      });
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          innerData['condition'] ==
                                                                  0
                                                              ? Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Remarks",
                                                                    ),
                                                                    SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          TextFormField(
                                                                        onChanged:
                                                                            (value) {
                                                                          innerData['remarks'] =
                                                                              value;
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              : SizedBox(),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            color: Colors.black,
                                                            height: 1,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  .toList()
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  ],
                                ),
                              )),
                        ),
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
              onPressed: () {
                if (vehicleIdDefaultId == "") {
                  provider.showSnakeBar("Select Vehicle ID", context);
                } else {
                  Map requiredData = {
                    'location_id': provider.location_id,
                    'user_id': provider.userId,
                    "machine_id": provider.excavatorMaintainaceDailyDetails[0]
                        ['machine_id'],
                    "vehicle_id": vehicleIdDefaultId,
                    "LineItem_ID":
                        json.encode(provider.excavatorMaintainaceDailyData),
                  };

                  provider.submitExcavatorMaintainaceDailyData(
                      context, requiredData);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
