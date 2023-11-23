import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';

import '../../theme/common_theme.dart';
import '../commonheader/common_header.dart';

class viewesmpcontrolpans extends StatefulWidget {
  const viewesmpcontrolpans({super.key});
  @override
  State<viewesmpcontrolpans> createState() => _viewesmpcontrolpansState();
}

class _viewesmpcontrolpansState extends State<viewesmpcontrolpans> {
  final _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  String? selectedDateForBackendDeveloper;
  TextEditingController dateinput = TextEditingController();
  TextEditingController IngetDate = TextEditingController();
  TextEditingController CompletionDate = TextEditingController();
  TextEditingController Responsibility = TextEditingController();
  TextEditingController karan = TextEditingController();
  String cvalue = "";
  @override
  String created_by_user_id = "";
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Cmhq List", "View"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            // viewesmpcontrolpans
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: CommonTheme.headerCommonColor,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '  View Esmp    ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              ...provider.Workpanbyid.map(
                (e) => Form(
                  // key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              ' work_plan_number',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("   ${e['work_plan_number']}"),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'mechanism',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("   ${e['mechanism']}"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Control',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("   ${e['control']}"),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'subject',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("   ${e['subject']}"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 23,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),

                      Container(
                        color: CommonTheme.headerCommonColor,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8,
                          ),
                          child: Text(
                            'Initiation Date*    ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: dateinput,
                        decoration: InputDecoration(
                            //icon of text field
                            //labelText: "Enter  Date",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))
                            //label text of field
                            ),

                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),

                      SizedBox(
                        height: 23,
                      ),

                      Container(
                        color: CommonTheme.headerCommonColor,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8,
                          ),
                          child: Text(
                            'Target date*    ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: IngetDate,
                        decoration: InputDecoration(
                            //icon of text field
                            //labelText: "Enter  Date",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))
                            //label text of field
                            ),

                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              IngetDate.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      SizedBox(
                        height: 23,
                      ),

                      Container(
                        color: CommonTheme.headerCommonColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Completion Date*    ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: CompletionDate,
                        decoration: InputDecoration(
                            //icon of text field
                            //labelText: "Enter  Date",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))
                            //label text of field
                            ),

                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              CompletionDate.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),

                      SizedBox(
                        height: 23,
                      ),

                      //  Padding(
                      //  padding: const EdgeInsets.only(
                      //     top: 10,
                      //     right: 210
                      // ),
                      //  child: Text(
                      //  'Location*    ',
                      //  style: TextStyle(
                      //    fontSize: 22,
                      //    fontWeight: FontWeight.bold,
                      // ),
                      //  ),
                      //  ),

                      // SizedBox(
                      //   height:15,
                      // ),
                      //  Container(
                      //   width: 370.0,
                      //   height: 50.0,
                      //   decoration: BoxDecoration(
                      //    borderRadius: BorderRadius.circular(15),
                      //    border: Border.all(),
                      //   ),
                      //  child: DropdownButtonFormField<String>(
                      //   value: cvalue,
                      //  isExpanded: true,
                      //   items: [
                      //    DropdownMenuItem(

                      //   child: TextField (
                      //    controller: Location,
                      //   decoration: InputDecoration(
                      //      border: InputBorder.none,
                      //      labelText: '   Location*',
                      //hintText: ' '
                      //  ),
                      //   ),
                      //  value: '',
                      //  ),
                      //  ...provider.Workpanbyid
                      //   .map<DropdownMenuItem<String>>((ce) {
                      //   return DropdownMenuItem(
                      //   child: Text(
                      //     ce['erci'],
                      //  ),
                      //   value: ce['id'].toString(),
                      //  );
                      // }).toList(),
                      //  ],
                      //  onChanged: (Rahul) {
                      //   setState(() {
                      //    this.cvalue = Rahul!;
                      //  });
                      //  },
                      //  ),
                      SizedBox(
                        height: 1,
                      ),

                      SizedBox(
                        height: 23,
                      ),

                      Container(
                        color: CommonTheme.headerCommonColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Responsibility*    ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Consumer<AllInProvider>(
                        builder: (context, value, child) {
                          return Container(
                            width: 370.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(),
                            ),
                            child: DropdownButton(
                              value: cvalue,
                              isExpanded: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    " Users*",
                                  ),
                                  value: "",
                                ),
                                ...provider.Responsibility.map<
                                    DropdownMenuItem<String>>((ce) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      " ${ce['name']}",
                                    ),
                                    value: ce['id'].toString(),
                                  );
                                }).toList(),
                              ],
                              onChanged: (Rahul) {
                                setState(() {
                                  this.cvalue = Rahul!;
                                  print("fff ${this.cvalue}");
                                });
                              },
                            ),
                          );
                        },
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState?.save();
                            Map requiredData = {
                              // created_by_user_id
                              // 'created_by_user_id': provider.createdbyuserid,
                              'id': provider.Id,
                              'user_id': cvalue,
                              'location_id': provider.location_id,
                              'work_plan_id': e['id'],
                              'created_by_user_id': provider.userId,
                              'initiation_date': dateinput.text,
                              'inget_date': dateinput.text,
                              'completion_date': CompletionDate.text,
                              "LineItem_ID":
                                  json.encode(provider.checkListData),
                            };
                            print("sfsfs $requiredData");

                            provider.submitformesmps(context, requiredData);
                            // provider.work_plan_id = e['work_plan_id'].toString();
                          },
                          child: Text("Submit"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
