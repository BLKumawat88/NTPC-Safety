import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/all_in_provider.dart';
import '../../commonheader/common_header.dart';

class Hemmsystemeditandupdate extends StatefulWidget {
  const Hemmsystemeditandupdate({super.key});
  @override
  State<Hemmsystemeditandupdate> createState() =>
      _HemmsystemeditandupdateState();
}

class _HemmsystemeditandupdateState extends State<Hemmsystemeditandupdate> {
  final _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  String? selectedDateForBackendDeveloper;
  final timeController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController s_no_A = TextEditingController();
  TextEditingController equipment_number_B = TextEditingController();
  TextEditingController equipment_description_C = TextEditingController();
  TextEditingController capacity_D = TextEditingController();
  TextEditingController category_E = TextEditingController();
  TextEditingController no_of_days_F = TextEditingController();
  TextEditingController total_hrs_H = TextEditingController();
  TextEditingController running_hrs_I = TextEditingController();
  TextEditingController maint_hrs_J = TextEditingController();

  TextEditingController b_d_hrs_K = TextEditingController();
  TextEditingController available_hrs_L = TextEditingController();
  TextEditingController Availability_M = TextEditingController();
  TextEditingController Utilization_N = TextEditingController();
  TextEditingController OEE_O = TextEditingController();

  String vehicleIdDefaultId = "";

  String totalHours = "";
  String runningValue = "";
  String maintenanceHrs = "";
  String bdHrs = "";

  String availableHoursDummyToGetAvalibality = "";
  String returnAvailableHours() {
    availableHoursDummyToGetAvalibality =
        "${int.parse(totalHours == "" ? "0" : totalHours) - (int.parse(maintenanceHrs == "" ? "0" : maintenanceHrs) + int.parse(bdHrs == "" ? "0" : bdHrs))}";
    return " ${int.parse(totalHours == "" ? "0" : totalHours) - (int.parse(maintenanceHrs == "" ? "0" : maintenanceHrs) + int.parse(bdHrs == "" ? "0" : bdHrs))}";
  }

  @override
  void initState() {
    AllInProvider provider = Provider.of(context, listen: false);
    // TODO: implement initState
    super.initState();
    totalHours = provider.Hemmsystemeditandupdate[0]['total_hrs_H'];
    runningValue = provider.Hemmsystemeditandupdate[0]['running_hrs_I'];
    maintenanceHrs = provider.Hemmsystemeditandupdate[0]['maint_hrs_J'];
    bdHrs = provider.Hemmsystemeditandupdate[0]['b_d_hrs_K'];
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "CopyOf_HEMM_MonitoringSystem_CmhqRecord", "View"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 35,
                  left: 0,
                ),
                child: Text(
                  'HEMM_ dispatch form UPDATE',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...provider.Hemmsystemeditandupdate.map(
                (e) => Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          dateinput.text = value!;
                        },
                        enabled: false,
                        initialValue: "${e['date']}",
                        // controller: dateinput,
                        decoration: InputDecoration(
                            //icon of text field

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
                        height: 10,
                      ),
                      Text(
                        'Sl No',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          s_no_A.text = value!;
                        },
                        initialValue: "${e['s_no_A']}",
                        //  controller: s_no_A,
                        decoration: InputDecoration(
                          labelText: "Sl No",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Equipment_number',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          equipment_number_B.text = value!;
                        },
                        initialValue: "${e['equipment_number_B']}",
                        //  controller: equipment_number_B,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Equipment Description',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          equipment_description_C.text = value!;
                        },
                        initialValue: "${e['equipment_description_C']}",
                        //  controller: equipment_number_B,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Capacity',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          capacity_D.text = value!;
                        },
                        initialValue: "${e['capacity_D']}",
                        //  controller: equipment_description_C,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          category_E.text = value!;
                        },
                        initialValue: "${e['category_E']}",
                        // controller: capacity_D,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No. of Days',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          if (value != "") {
                            print(" Total hours${int.parse(value) * 24}");
                            setState(() {
                              int totalHoursDummy = int.parse(value) * 24;
                              totalHours = totalHoursDummy.toString();
                            });
                          } else {
                            setState(() {
                              totalHours = "";
                            });
                          }
                        },
                        onSaved: (value) {
                          no_of_days_F.text = value!;
                        },
                        initialValue: "${e['no_of_days_F']}",
                        // controller: no_of_days_F,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Total Hrs',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: totalHours != ""
                                ? Text(
                                    "  ${totalHours} Hours",
                                    textAlign: TextAlign.left,
                                  )
                                : Text("")),
                      ),
                      // TextFormField(
                      //   onSaved: (value) {
                      //     total_hrs_H.text = value!;
                      //   },
                      //   initialValue: "${e['total_hrs_H']}",
                      //   // controller: total_hrs_H,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Running',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            runningValue = value;
                          });
                          // running_hrs_I.text = value!;
                        },
                        initialValue: runningValue,
                        //  controller: running_hrs_I,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Maint. Hrs"',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            maintenanceHrs = value;
                          });
                          print(maintenanceHrs);
                          // maint_hrs_J.text = value!;
                        },
                        initialValue: maintenanceHrs,
                        // controller: maint_hrs_J,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'B/D. Hrs"',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            bdHrs = value;
                          });

                          // maint_hrs_J.text = value!;
                        },
                        initialValue: bdHrs,
                        // controller: maint_hrs_J,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     top: 3,
                      //     right: 247,
                      //   ),
                      //   child: Text(
                      //     'Available Hrs',
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.blue,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   onSaved: (value) {
                      //     available_hrs_L.text = value!;
                      //   },
                      //   initialValue: "${e['available_hrs_L']}",
                      //   //controller: available_hrs_L,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     top: 3,
                      //     right: 247,
                      //   ),
                      //   child: Text(
                      //     'Availability',
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.blue,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   onSaved: (value) {
                      //     Availability_M.text = value!;
                      //   },
                      //   initialValue: "${e['Availability_M']}",
                      //   // controller: Availability_M,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     top: 3,
                      //     right: 247,
                      //   ),
                      //   child: Text(
                      //     'Utilization',
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.blue,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   onSaved: (value) {
                      //     Utilization_N.text = value!;
                      //   },
                      //   initialValue: "${e['Utilization_N']}",
                      //   // controller: Utilization_N,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     top: 3,
                      //     right: 247,
                      //   ),
                      //   child: Text(
                      //     'OEE',
                      //     style: TextStyle(
                      //       fontSize: 17,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.blue,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   onSaved: (value) {
                      //     OEE_O.text = value!;
                      //   },
                      //   initialValue: "${e['OEE_O']}",
                      //   //controller: OEE_O,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),

                      SizedBox(
                        height: 10,
                      ),
                      Text("Available Hrs"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(returnAvailableHours()),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text("Availability"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                              "${int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100}" ==
                                      "NaN"
                                  ? ""
                                  : " ${int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100}%"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Utilization"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                              "${int.parse(runningValue == "" ? "0" : runningValue) / int.parse(returnAvailableHours()) * 100}" ==
                                      "NaN"
                                  ? ""
                                  : " ${int.parse(runningValue == "" ? "0" : runningValue) / int.parse(returnAvailableHours()) * 100}%"),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text("OEE"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                              "${(int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100 * int.parse(runningValue == "" ? "0" : runningValue) / int.parse(returnAvailableHours()) * 100) / 100}" ==
                                      "NaN"
                                  ? ""
                                  : " ${(int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100 * int.parse(runningValue == "" ? "0" : runningValue) / int.parse(returnAvailableHours()) * 100) / 100}"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print("IDDD ${provider.Id}");
                            _formKey.currentState?.save();
                            Map requiredData = {
                              'id': provider.Id,
                              'user_id': provider.userId,
                              'location_id': provider.location_id,
                              'date': dateinput.text,
                              's_no_A': s_no_A.text,
                              'equipment_number_B': equipment_number_B.text,
                              'equipment_description_C':
                                  equipment_description_C.text,
                              'capacity_D': capacity_D.text,
                              'category_E': category_E.text,
                              'no_of_days_F': no_of_days_F.text,
                              'total_hrs_H': totalHours,
                              'running_hrs_I': runningValue,
                              'maint_hrs_J': maintenanceHrs,
                              'b_d_hrs_K': bdHrs,
                              'available_hrs_L':
                                  "${int.parse(totalHours == "" ? "0" : totalHours) - (int.parse(maintenanceHrs == "" ? "0" : maintenanceHrs) + int.parse(bdHrs == "" ? "0" : bdHrs))}",
                              'Availability_M':
                                  "${int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100}",
                              'Utilization_N':
                                  "${int.parse(runningValue == "" ? "0" : runningValue) / int.parse(returnAvailableHours()) * 100}",
                              'OEE_O':
                                  "${(int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100 * int.parse(runningValue == "" ? "0" : runningValue) / int.parse(returnAvailableHours()) * 100) / 100}",
                              "LineItem_ID":
                                  json.encode(provider.checkListData),
                            };
                            print(" sfsfs $requiredData");

                            provider.HemmMonitoringsystemupdatefrome(
                                context, requiredData);
                          },
                          child: Text("Submit"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
